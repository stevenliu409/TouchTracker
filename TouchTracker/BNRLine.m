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


+ (void)strokeLine:(BNRLine *)line
{
    
    [line.color set];
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}


+ (UIColor *)colorWithLine:(BNRLine *)line
{
    if ([self isQ1:line]) {
        return [UIColor orangeColor];
    } else if ([self isQ2:line]){
        return [UIColor greenColor];
    } else if ([self isQ3:line]) {
        return [UIColor blueColor];
    } else {
        return [UIColor yellowColor];
    }
}


+ (BOOL)isQ1:(BNRLine *)line
{
    return line.begin.x <= line.end.x && line.begin.y <= line.end.y;
}
+ (BOOL)isQ2:(BNRLine *)line
{
    return line.begin.x >= line.end.x && line.begin.y < line.end.y;
}
+ (BOOL)isQ3:(BNRLine *)line
{
    return line.begin.x > line.end.x && line.begin.y >= line.end.y;
}

@end
