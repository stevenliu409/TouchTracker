//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-16.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"
#import "BNRCircle.h"

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
    for (BNRShape *line in self.finishedLines) {
        [line drawShape];
    }
    
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
        BNRCircle *circle = [[BNRCircle alloc] init];
        circle.color = [UIColor redColor];
        CGPoint pointA = [touchArray[0] locationInView:self];
        CGPoint pointB = [touchArray[1] locationInView:self];
        circle.center = [BNRCircle centerBetweenA:pointA andB:pointB];
        circle.radius = [BNRCircle distanceBetweenA:pointA andB:pointB]/2;
        NSValue *key = [NSValue valueWithNonretainedObject:touchArray[1]];
        self.linesInProgress[key] = circle;
    }
    else {
        for (UITouch *t in touches) {
            CGPoint location = [t locationInView:self];
            BNRLine *line = [[BNRLine alloc] init];
            line.color = [UIColor redColor];
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
    
    if ([touches count] == 2) {
        NSArray *touchArray = [touches allObjects];
        NSValue *key = [NSValue valueWithNonretainedObject:touchArray[1]];
        if ([self.linesInProgress[key] isKindOfClass:[BNRCircle class]]) {
            BNRCircle *circle = self.linesInProgress[key];
            CGPoint pointA = [touchArray[0] locationInView:self];
            CGPoint pointB = [touchArray[1] locationInView:self];
            circle.radius = [BNRCircle distanceBetweenA:pointA andB:pointB];
        }
    } else {
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            if ([self.linesInProgress[key] isKindOfClass:[BNRLine class]]) {
                BNRLine *line = self.linesInProgress[key];
                line.end = [t locationInView:self];
            }
        }
    }
    
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd)); // log the name of the current method

    if ([touches count] == 2) {
        NSArray *touchArray = [touches allObjects];
        NSValue *key = [NSValue valueWithNonretainedObject:touchArray[1]];
        if ([self.linesInProgress[key] isKindOfClass:[BNRCircle class]]) {
            BNRCircle *circle = self.linesInProgress[key];
            [self.finishedLines addObject:circle];
        }
        [self.linesInProgress removeObjectForKey:key];
    } else {
        for (UITouch *t in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:t];
            if ([self.linesInProgress[key] isKindOfClass:[BNRLine class]]) {
                BNRLine *line = self.linesInProgress[key];
                [line setLineColor];
                [self.finishedLines addObject:line];
            }
            [self.linesInProgress removeObjectForKey:key];
        }
    }
    
    [self setNeedsDisplay];
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd)); // log the name of the current method
    if ([touches count] == 2) {
        NSArray *touchArray = [touches allObjects];
        NSValue *key = [NSValue valueWithNonretainedObject:touchArray[1]];
        [self.linesInProgress removeObjectForKey:key];
    } else {
        for (UITouch *touch in touches) {
            NSValue *key = [NSValue valueWithNonretainedObject:touch];
            [self.linesInProgress removeObjectForKey:key];
        }
    }
    
    [self setNeedsDisplay];
}
@end
