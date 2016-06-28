//
//  BNRShape.h
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-26.
//  Copyright © 2016 Steven Liu. All rights reserved.
//
// Please Subclass
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface BNRShape : NSObject

@property (nonatomic, strong) UIColor *color;

- (void)drawShape;

@end
