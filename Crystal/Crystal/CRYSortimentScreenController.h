//
//  CRYSortimentScreenController.h
//  Crystal
//
//  Created by Steffen on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRYBeaconObject.h"

@interface CRYSortimentScreenController : UITableViewController <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) CRYBeaconObject *beacon;
@end
