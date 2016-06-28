//
//  BNRLine.m
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-16.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRLine.h"

@implementation BNRLine

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSValue valueWithCGPoint:self.begin] forKey:@"begin"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.end] forKey:@"end"];
    [encoder encodeObject:self.color forKey:@"color"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.begin = [[decoder decodeObjectForKey:@"begin"] CGPointValue];
        self.end = [[decoder decodeObjectForKey:@"end"] CGPointValue];
        self.color = [decoder decodeObjectForKey:@"color"];
    }
    return self;
}


- (void)drawShape
{
    [self.color set];
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp moveToPoint:self.begin];
    [bp addLineToPoint:self.end];
    [bp stroke];
}


- (void)setLineColor
{
    if ([self isQ1]) {
        self.color = [UIColor orangeColor];
    } else if ([self isQ2]){
        self.color = [UIColor greenColor];
    } else if ([self isQ3]) {
        self.color = [UIColor blueColor];
    } else {
        self.color = [UIColor yellowColor];
    }
}


- (BOOL)isQ1
{
    return self.begin.x <= self.end.x && self.begin.y <= self.end.y;
}
- (BOOL)isQ2
{
    return self.begin.x >= self.end.x && self.begin.y < self.end.y;
}
- (BOOL)isQ3
{
    return self.begin.x > self.end.x && self.begin.y >= self.end.y;
}

@end
