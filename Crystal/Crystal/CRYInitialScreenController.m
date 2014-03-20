//
//  CRYInitialScreenController.m
//  Crystal
//
//  Created by Steffen on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYInitialScreenController.h"

#import "CRYQuestionDetailViewController.h"

#import "UIColor+CRYExt.h"
#import "CRYUserSettings.h"

@interface CRYInitialScreenController ()
@property(nonatomic, strong) NSDictionary *interest;
@end

@implementation CRYInitialScreenController

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
	self.interest = [CRYUserSettings fehlAmPlatzAberIrgendwoMuessenDieKategorienHin];
//    self.interest = @{@"Geschichte": @[@"WW I", @"WW II", @"WW III"],
//                      @"Sport": @[@"Fußball", @"Handballd", @"Basketball"],
//                      @"Lesen": @[],
//                      @"Architektur": @[]};
}

-(void)viewWillAppear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor whiteBackground];
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor whiteBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segQuestionDetail"]) {
        CRYQuestionDetailViewController *dest = segue.destinationViewController;
        
        NSString* key = self.interest.allKeys[self.tableView.indexPathForSelectedRow.row];
        
        dest.title = [key uppercaseString];
        dest.items = self.interest[key];
    }
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
- (IBAction)tappedDoneButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.interest.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell) {
        cell.textLabel.text = self.interest.allKeys[indexPath.row];
        cell.textLabel.textColor = [UIColor blueFontColor];
        cell.backgroundView = nil;
        cell.backgroundColor = [UIColor whiteBackground];
                
        [cell setIndentationLevel:32];
        [cell setIndentationWidth:1];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
