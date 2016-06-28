//
//  BNRCircle.m
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-26.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRCircle.h"

@implementation BNRCircle

- (void)strokeCircle:(BNRCircle *)circle
{
    [circle.color set];
    UIBezierPath *bp = [UIBezierPath bezierPathWithArcCenter:self.center
                                                      radius:self.radius
                                                  startAngle:0
                                                    endAngle:M_PI * 2
                                                   clockwise:YES];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp stroke];
}

- (CGFloat)distanceBetweenA:(CGPoint)a andB:(CGPoint)b
{
    CGFloat distance = pow((b.x - a.x), 2)  + pow((b.y - a.y), 2);
    distance = sqrtf(distance);
    return distance;
}

@end
