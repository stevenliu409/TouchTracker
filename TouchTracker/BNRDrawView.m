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
        [line drawShape];
    }
    
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProgress) {
        [self.linesInProgress[key] drawShape];
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
        [line setLineColor];
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


-(UIColor *)randomColor
{
    float red = (arc4random() % 100)/100.0;
    float green = (arc4random() % 100)/100.0;
    float blue = (arc4random() % 100)/100.0;

    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return color;
}







@end
