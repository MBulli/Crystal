//
//  CRYCategoryViewController.m
//  Crystal
//
//  Created by Markus on 3/20/14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYCategoryViewController.h"

#import "CRYUserSettings.h"

@interface CRYFlowLayout : UICollectionViewFlowLayout

@end

@interface CRYCategoryViewController ()

@property(nonatomic, strong) NSArray* dummy;

@end

@implementation CRYCategoryViewController

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

    self.scrollView.contentSize = CGSizeMake(1, 736);
    
    for (UIView *view in self.scrollView.subviews) {
        view.alpha = 0;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    if (![[CRYUserSettings loadCategories] containsObject:@"Gemüse"]) {
        [self.greenZeug setImage:[UIImage imageNamed:@"ArticleSlice5_06"] forState:UIControlStateNormal];
        [self.greenZeug setEnabled:NO];
    } else {
        [self.greenZeug setImage:[UIImage imageNamed:@"ArticleSlice5_02"] forState:UIControlStateNormal];
        [self.greenZeug setEnabled:YES];
    }
    
    for (UIView *view in self.scrollView.subviews) {
        
        CGFloat dur = (arc4random() % 10) / 10.0;
        NSLog(@"%f", dur);
        
        view.alpha = 0;
        
        [UIView animateWithDuration:dur animations:^{
            view.alpha = 1.0f;
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
