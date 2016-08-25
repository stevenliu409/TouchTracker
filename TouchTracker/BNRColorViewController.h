//
//  BNRColorViewController.h
//  TouchTracker
//
//  Created by Steven Liu on 2016-08-24.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BNRColorViewDelegate <NSObject>

- (void)colorChosen:(UIColor *)color;

@end

@interface BNRColorViewController : UIViewController
@property (nonatomic, weak) id<BNRColorViewDelegate> delegate;

@end
