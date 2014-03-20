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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
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

- (IBAction)tappedAngebotButton:(id)sender {
}

- (IBAction)tappedSortimentButton:(id)sender {
}

- (IBAction)tappedInterestButton:(id)sender {
    
    
    CRYInitialScreenController *initSetup = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CRYInitialScreenController"];
    [initSetup setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:initSetup animated:YES completion:nil];
    
}




@end
