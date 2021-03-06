//
//  CRYViewController.m
//  Crystal
//
//  Created by xcode on 19.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYViewController.h"
#import "CRYBeaconManager.h"


@interface CRYViewController ()

@property(nonatomic, strong) CRYBeaconManager* manager;
@end

@implementation CRYViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setNeedsStatusBarAppearanceUpdate];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.manager = [[CRYBeaconManager alloc] initWithUUID:@[@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"] majorNumber:@[@56441] minorNumber:@[@60568] identifier:@[@"test"]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
