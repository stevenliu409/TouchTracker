//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-16.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView()

@end

@implementation BNRDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    for (BNRLine *line in self.finishedLines) {
        [BNRLine strokeLine:line];
    }
    
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProgress) {
        [BNRLine strokeLine:self.linesInProgress[key]];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd)); // log the name of the current method
    NSLog(@"size of touches %ld", (unsigned long)[touches count]);
    
    if ([touches count] == 2) {
        NSArray *touchArray = [touches allObjects];
    }
    else {
        for (UITouch *t in touches) {
            CGPoint location = [t locationInView:self];
            BNRLine *line = [[BNRLine alloc] init];
            line.type = typeLine;
            line.begin = location;
            line.end = location;
            
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            self.linesInProgress[key] = line;
        }
    }
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    NSLog(@"%@", NSStringFromSelector(_cmd)); // log the name of the current method
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        line.end = [t locationInView:self];
    }
    
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd)); // log the name of the current method

    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        line.color = [BNRLine colorWithLine:line];
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd)); // log the name of the current method
    
    for (UITouch *touch in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}




- (void)strokeCircle:(BNRLine *)line
{
    [line.color set];
    UIBezierPath *bp = [UIBezierPath bezierPathWithArcCenter:line.begin
                                                      radius:[self distanceBetweenA:line.begin andB:line.end]
                                                  startAngle:0
                                                    endAngle:M_PI * 2
                                                   clockwise:YES];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp stroke];
}



-(UIColor *)randomColor
{
    float red = (arc4random() % 100)/100.0;
    float green = (arc4random() % 100)/100.0;
    float blue = (arc4random() % 100)/100.0;

    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return color;
}

#pragma mark - helper methods


- (CGFloat)distanceBetweenA:(CGPoint)a andB:(CGPoint)b
{
    CGFloat distance = pow((b.x - a.x), 2)  + pow((b.y - a.y), 2);
    distance = sqrtf(distance);
    return distance;
}


@end
