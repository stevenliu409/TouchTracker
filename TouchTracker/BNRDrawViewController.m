//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-16.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"
#import "BNRColorViewController.h"


@interface BNRDrawViewController () <BNRColorViewDelegate>

@property (nonatomic, strong) UISwipeGestureRecognizer *tripleSwipeRecognizer;
@property (nonatomic, strong) BNRDrawView *drawView;
@end

@implementation BNRDrawViewController

- (void)loadView
{
    self.drawView = [[BNRDrawView alloc] initWithFrame:CGRectZero];
    self.view = self.drawView;
}

- (void)viewDidLoad
{
    self.tripleSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(colorPicker:)];
    self.tripleSwipeRecognizer.numberOfTouchesRequired = 3;
    self.tripleSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:self.tripleSwipeRecognizer];

}

- (void)colorPicker:(UISwipeGestureRecognizer *)gr
{
    BNRColorViewController *colorview = [[BNRColorViewController alloc] init];
    colorview.delegate = self;
    [self presentViewController:colorview animated:YES completion:nil];
}

- (void)colorChosen:(UIColor *)color
{
    self.drawView.chosenColor = color;
}


@end
