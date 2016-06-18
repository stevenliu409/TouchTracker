//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-16.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@interface BNRDrawViewController ()
@property (nonatomic, strong) BNRDrawView *backgroundView;
@end

@implementation BNRDrawViewController

- (void)loadView
{
    self.backgroundView = [[BNRDrawView alloc] initWithFrame:CGRectZero];
    self.view = self.backgroundView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(saveData)
                                                 name:@"UIApplicationWillResignActiveNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getData)
                                                 name:@"UIApplicationDidBecomeActiveNotification"
                                               object:nil];
    
    UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 100, 30)];
    [clearButton setTitle:@"Clear Board" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];

}

- (void)saveData
{
    NSLog(@"saving data...");
    NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:self.backgroundView.finishedLines];
    [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:@"finishedLines"];
}

- (void)getData
{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"finishedLines"];
    if (data != nil) {
        NSMutableArray *myData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        self.backgroundView.finishedLines = myData;
    }
}

- (void)clear
{
    [self.backgroundView.finishedLines removeAllObjects];
    [self.view setNeedsDisplay];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
