//
//  BNRCircle.h
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-26.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRShape.h"

@interface BNRCircle : BNRShape

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;

+ (CGFloat)distanceBetweenA:(CGPoint)a andB:(CGPoint)b;
+ (CGPoint)centerBetweenA:(CGPoint)a andB:(CGPoint)b;

@end
