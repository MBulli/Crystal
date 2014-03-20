//
//  CRYStartScreenController.m
//  Crystal
//
//  Created by Steffen on 19.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYStartScreenController.h"

#import "CRYInitialScreenController.h"
#import "CRYBeaconManager.h"
@interface CRYStartScreenController ()

@property(nonatomic, strong) CRYBeaconManager* manager;
@end

@implementation CRYStartScreenController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
     NSLog(@"view loaded");
}


- (void)viewDidAppear:(BOOL)animated
{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"initScreenShown"]) {
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"initScreenShown"];
        
        CRYInitialScreenController *initSetup = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CRYInitialScreenController"];
        [initSetup setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentViewController:initSetup animated:YES completion:nil];
    }
    self.manager = [[CRYBeaconManager alloc] initWithUUID:@[@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"] majorNumber:@[@56441] minorNumber:@[@60568] identifier:@[@"test"]];

}



- (IBAction)tappedFavoritesButton:(id)sender {
    
    NSLog(@"lala");
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedSettingsButton:(UIButton *)sender {
}


@end
