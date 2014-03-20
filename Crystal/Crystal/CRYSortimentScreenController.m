//
//  CRYSortimentScreenController.m
//  Crystal
//
//  Created by Steffen on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYSortimentScreenController.h"
#import "UIColor+CRYExt.h"


@interface CRYSortimentScreenController ()

@end

@implementation CRYSortimentScreenController
@synthesize beacon;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.searchBar.delegate = self;
	self.beacon = [CRYBeaconObject beacon:@"eine-uuid"];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
	[beacon filterArray:searchText];
	[self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return beacon.filteredArticles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"my_cell" forIndexPath:indexPath];
    
    if (cell) {
		NSDictionary *obj =self.beacon.filteredArticles[indexPath.row];
        cell.textLabel.text = [obj valueForKey:@"name"];
		cell.detailTextLabel.text = [obj valueForKey:@"description"];
		cell.imageView.image = [UIImage imageNamed:[obj valueForKey:@"image"]];
		cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
        cell.textLabel.textColor = [UIColor blueFontColor];
        cell.backgroundView = nil;
        cell.backgroundColor = [UIColor whiteBackground];

//        [cell setIndentationLevel:32];
//        [cell setIndentationWidth:1];
    }
    
    return cell;
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
