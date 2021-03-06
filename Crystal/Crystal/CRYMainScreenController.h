//
//  CRYMainScreenController.h
//  Crystal
//
//  Created by Steffen on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRYMainScreenController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *angebotButton;
@property (weak, nonatomic) IBOutlet UIButton *sortimentButton;

@property(nonatomic, assign) BOOL Beacon1;
@property(nonatomic, assign) BOOL Beacon2;

- (IBAction)tappedAngebotButton:(id)sender;
- (IBAction)tappedSortimentButton:(id)sender;
- (IBAction)tappedInterestButton:(id)sender;

@end
