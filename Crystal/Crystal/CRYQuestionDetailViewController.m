//
//  CRYQuestionDetailViewController.m
//  Crystal
//
//  Created by Markus on 3/20/14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYQuestionDetailViewController.h"

#import "UIColor+CRYExt.h"
#import "CRYUserSettings.h"

@interface CRYQuestionDetailViewController ()

@end

@implementation CRYQuestionDetailViewController

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

-(void)viewWillAppear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor whiteBackground];
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor whiteBackground];
    
    self.headlineLabel.text = self.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tappedDoneButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell) {
        cell.textLabel.text = self.items[indexPath.row];
        cell.textLabel.textColor = [UIColor blueFontColor];
        cell.backgroundView = nil;
        cell.backgroundColor = [UIColor whiteBackground];
        
        [cell setIndentationLevel:32];
        [cell setIndentationWidth:1];
		
		NSArray *cats = [CRYUserSettings loadCategories];
		for (NSString *s in cats) {
			if ([s isEqualToString:cell.textLabel.text]) {
				cell.accessoryType =UITableViewCellAccessoryCheckmark;
			}
		}
		
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	
	NSMutableArray *cats = [[CRYUserSettings loadCategories] mutableCopy];
	
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
		[cats removeObject:cell.textLabel.text];
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
		[cats addObject:cell.textLabel.text];
    }
	[CRYUserSettings saveCategories:cats];
}
@end
