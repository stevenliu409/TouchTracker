//
//  BNRColorView.m
//  TouchTracker
//
//  Created by Steven Liu on 2016-08-24.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRColorView.h"

@interface BNRColorView ()

@end


@implementation BNRColorView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        CGPoint center;
        center.x = self.bounds.origin.x + self.bounds.size.width/2.0;
        center.y = (self.bounds.origin.y + self.bounds.size.height/2.0) - 50;
        
        UIStackView *stackView = [[UIStackView alloc] initWithFrame:CGRectMake(0, center.y, self.bounds.size.width, 100)];
        
        stackView.axis = UILayoutConstraintAxisVertical;
        stackView.distribution = UIStackViewDistributionFillEqually;
        
        self.stackViewRowOne = [[UIStackView alloc] init];
        self.stackViewRowOne.axis =  UILayoutConstraintAxisHorizontal;
        self.stackViewRowOne.distribution = UIStackViewDistributionFillEqually;
        
        
        self.stackViewRowTwo = [[UIStackView alloc] init];
        self.stackViewRowTwo.axis =  UILayoutConstraintAxisHorizontal;
        self.stackViewRowTwo.distribution = UIStackViewDistributionFillEqually;

        [stackView addArrangedSubview:self.stackViewRowOne];
        [stackView addArrangedSubview:self.stackViewRowTwo];
        
        [self addSubview:stackView];
    }
    return self;
}


@end
