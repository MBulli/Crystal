//
//  CRYMainScreenController.m
//  Crystal
//
//  Created by Steffen on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYMainScreenController.h"
#import "CRYInitialScreenController.h"


@interface CRYMainScreenController ()

@end

@implementation CRYMainScreenController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tappedAngebotButton:(id)sender
{
    if (self.Beacon1) {
        [self performSegueWithIdentifier:@"seg_beacon1" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"seg_beacon2" sender:self];
    }
}

- (IBAction)tappedSortimentButton:(id)sender
{
    if (self.Beacon1) {
        [self performSegueWithIdentifier:@"seg_beaconSort1" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"seg_beaconSort2" sender:self];
    }
}

- (IBAction)tappedInterestButton:(id)sender {
    
    
    CRYInitialScreenController *initSetup = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CRYInitialScreenController2"];
    [initSetup setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:initSetup animated:YES completion:nil];
    
}




@end
