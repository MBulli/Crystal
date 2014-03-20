//
//  CRYQuestionDetailViewController.h
//  Crystal
//
//  Created by Markus on 3/20/14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRYQuestionDetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *headlineLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong) NSArray *items;

@end
