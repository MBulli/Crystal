//
//  CRYInit02ViewController.m
//  Crystal
//
//  Created by xcode on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYInit02ViewController.h"

@interface CRYInit02ViewController ()

@end

@implementation CRYInit02ViewController

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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}


-(void)viewDidAppear:(BOOL)animated
{
    [self performSelector:@selector(switchScreen) withObject:nil afterDelay:5];
}

-(void)switchScreen
{
    [self performSegueWithIdentifier:@"segStep02" sender:self];
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

@end
