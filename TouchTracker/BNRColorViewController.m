//
//  BNRColorViewController.m
//  TouchTracker
//
//  Created by Steven Liu on 2016-08-24.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRColorViewController.h"
#import "BNRColorView.h"
@interface BNRColorViewController ()
@property (nonatomic, strong) BNRColorView *colorView;
@end

@implementation BNRColorViewController

- (void)loadView
{
    self.colorView = [[BNRColorView alloc] initWithFrame:[UIScreen mainScreen].bounds] ;
    self.view = self.colorView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *redButton = [[UIButton alloc] init];
    [redButton setTitle:@"" forState:UIControlStateNormal];
    [redButton setBackgroundColor:[UIColor redColor]];
    [redButton addTarget:self action:@selector(colorRed) forControlEvents:UIControlEventTouchUpInside];

    [self.colorView.stackViewRowOne addArrangedSubview:redButton];
    
    UIButton *blueButton = [[UIButton alloc] init];
    [blueButton setTitle:@"" forState:UIControlStateNormal];
    [blueButton setBackgroundColor:[UIColor blueColor]];
    [blueButton addTarget:self action:@selector(colorBlue) forControlEvents:UIControlEventTouchUpInside];
    
    [self.colorView.stackViewRowOne addArrangedSubview:blueButton];
    
    UIButton *greenButton = [[UIButton alloc] init];
    [greenButton setTitle:@"" forState:UIControlStateNormal];
    [greenButton setBackgroundColor:[UIColor greenColor]];
    [greenButton addTarget:self action:@selector(colorGreen) forControlEvents:UIControlEventTouchUpInside];
    
    [self.colorView.stackViewRowOne addArrangedSubview:greenButton];
    
    
    UIButton *blackButton = [[UIButton alloc] init];
    [blackButton setTitle:@"" forState:UIControlStateNormal];
    [blackButton setBackgroundColor:[UIColor blackColor]];
    [blackButton addTarget:self action:@selector(colorBlack) forControlEvents:UIControlEventTouchUpInside];
    
    [self.colorView.stackViewRowTwo addArrangedSubview:blackButton];
    
    UIButton *whiteButton = [[UIButton alloc] init];
    [whiteButton setTitle:@"" forState:UIControlStateNormal];
    [whiteButton setBackgroundColor:[UIColor whiteColor]];
    [whiteButton addTarget:self action:@selector(colorWhite) forControlEvents:UIControlEventTouchUpInside];
    
    [self.colorView.stackViewRowTwo addArrangedSubview:whiteButton];
    
    UIButton *grayButton = [[UIButton alloc] init];
    [grayButton setTitle:@"" forState:UIControlStateNormal];
    [grayButton setBackgroundColor:[UIColor lightGrayColor]];
    [grayButton addTarget:self action:@selector(colorGray) forControlEvents:UIControlEventTouchUpInside];
    
    [self.colorView.stackViewRowTwo addArrangedSubview:grayButton];

}


- (void)colorRed
{
    [self.delegate colorChosen:[UIColor redColor]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)colorBlue
{
    [self.delegate colorChosen:[UIColor blueColor]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)colorGreen
{
    [self.delegate colorChosen:[UIColor greenColor]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)colorBlack
{
    [self.delegate colorChosen:[UIColor blackColor]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)colorWhite
{
    [self.delegate colorChosen:[UIColor whiteColor]];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)colorGray
{
    [self.delegate colorChosen:[UIColor lightGrayColor]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
