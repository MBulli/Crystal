//
//  CRYStartScreenController.h
//  Crystal
//
//  Created by Steffen on 19.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRYStartScreenController : UIViewController


@property (weak, nonatomic) IBOutlet UIView *CRYLogoBig;
@property (weak, nonatomic) IBOutlet UIButton *favoritesButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;


- (IBAction)tappedFavoritesButton:(id)sender;
- (IBAction)tappedSettingsButton:(id)sender;





@end
