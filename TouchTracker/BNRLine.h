//
//  BNRLine.h
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-16.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface BNRLine : NSObject

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;

@property (nonatomic) CGFloat width;
@property (nonatomic, strong) UIColor *color;
@end
