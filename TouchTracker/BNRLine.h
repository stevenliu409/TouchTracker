//
//  BNRLine.h
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-16.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRShape.h"

@interface BNRLine : BNRShape <NSCoding>

@property (nonatomic, assign) CGPoint begin;
@property (nonatomic, assign) CGPoint end;
@property (nonatomic, strong) UIColor *color;

- (void)setLineColor;
- (void)drawShape;

@end
