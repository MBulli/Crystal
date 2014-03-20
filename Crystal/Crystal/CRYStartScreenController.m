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
#import "CRYBeaconObject.h"
#import "CRYUserSettings.h"

@interface CRYStartScreenController ()
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, strong, readonly) CRYBeaconManager* manager;
@end

@implementation CRYStartScreenController

-(CRYBeaconManager *)manager
{
    static dispatch_once_t onceToken;
    static CRYBeaconManager* singleInstance;
    dispatch_once(&onceToken, ^{
        singleInstance = [[CRYBeaconManager alloc] initWithUUID:@[@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"] majorNumber:@[@56441] minorNumber:@[@60568] identifier:@[@"test"]];
    });
    return singleInstance;
}

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
    // Do any additional setup after loading the view from its nib.
    
     NSLog(@"view loaded");
	[self setNeedsStatusBarAppearanceUpdate];
//	[CRYUserSettings saveCategories:@[@"Getränke",@"nix"]];
//	CRYBeaconObject *beacon = [CRYBeaconObject beacon:@"uuid-beacon-id"];
//	NSLog(@"%@", [beacon advertisedArticles]);
//	[beacon filterArray:@"sup"];
//	NSLog(@"%@", beacon.filteredArticles);
}


- (void)viewDidAppear:(BOOL)animated
{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"initScreenShown"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"initScreenShown"];
        
        CRYInitialScreenController *initSetup = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CRYInitialScreenController"];
        [initSetup setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentViewController:initSetup animated:YES completion:nil];
    }
    
    self.animatedImageView.image = [UIImage animatedImageNamed:@"loading_cart_" duration:2.2];

    [self performSelector:@selector(noBeaconInTime) withObject:nil afterDelay:10];

    
    self.timer = [NSTimer timerWithTimeInterval:0.40
                                          target:self
                                        selector:@selector(timerTick)
                                        userInfo:nil
                                         repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
}
-(void)noBeaconInTime
{
    [self.timer invalidate];
    self.timer = nil;
    
    [self performSegueWithIdentifier: @"seg_nobeacon" sender: self];
}



-(void)timerTick
{
    if(self.manager.isBeaconInRange)
    {
        [self.timer invalidate];
        self.timer = nil;
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        
        [self performSegueWithIdentifier: @"seg_beacon" sender:self];
    }
    else
    {
        [self performSelector:@selector(timerTick) withObject:nil afterDelay:0.40]; 
    }
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
