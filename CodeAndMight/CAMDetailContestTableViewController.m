//
//  CAMDetailContestTableViewController.m
//  CodeAndMight
//
//  Created by Дмитрий on 22.07.14.
//  Copyright (c) 2014 Дмитрий. All rights reserved.
//

#import "CAMDetailContestTableViewController.h"

#import "CAMCodeforcesAPI.h"
#import "CAMContest.h"

@interface CAMDetailContestTableViewController ()

@end

@implementation CAMDetailContestTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 17;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *keyLabelIdentifier = @"KeyLabelIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:keyLabelIdentifier forIndexPath:indexPath];
    
    CAMContest *contest = [CAMCodeforcesAPI sharedCodeforcesAPI].contests[self.indexSelected];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"id";
        cell.detailTextLabel.text = contest.idNumber.stringValue;
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"name";
        cell.detailTextLabel.text = contest.name;
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"type";
        cell.detailTextLabel.text = contest.type;
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"phase";
        cell.detailTextLabel.text = contest.phase;
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"frozen";
        cell.detailTextLabel.text = @(contest.frozen).stringValue;
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"durationSeconds";
        cell.detailTextLabel.text = contest.durationSeconds.stringValue;
    } else if (indexPath.row == 6) {
        cell.textLabel.text = @"startTimeSeconds";
        cell.detailTextLabel.text = contest.startTimeSeconds.description;
    } else if (indexPath.row == 7) {
        cell.textLabel.text = @"relativeTimeSeconds";
        cell.detailTextLabel.text = contest.relativeTimeSeconds.stringValue;
    } else if (indexPath.row == 8) {
        cell.textLabel.text = @"preparedBy";
        cell.detailTextLabel.text = contest.preparedBy;
    } else if (indexPath.row == 9) {
        cell.textLabel.text = @"websiteUrl";
        cell.detailTextLabel.text = contest.websiteUrl.description;
    } else if (indexPath.row == 10) {
        cell.textLabel.text = @"description";
        cell.detailTextLabel.text = contest.deScription;
    } else if (indexPath.row == 11) {
        cell.textLabel.text = @"difficulty";
        cell.detailTextLabel.text = contest.difficulty.stringValue;
    } else if (indexPath.row == 12) {
        cell.textLabel.text = @"kind";
        cell.detailTextLabel.text = contest.kind;
    } else if (indexPath.row == 13) {
        cell.textLabel.text = @"icpcRegion";
        cell.detailTextLabel.text = contest.icpcRegion;
    } else if (indexPath.row == 14) {
        cell.textLabel.text = @"country";
        cell.detailTextLabel.text = contest.country;
    } else if (indexPath.row == 15) {
        cell.textLabel.text = @"city";
        cell.detailTextLabel.text = contest.city;
    } else if (indexPath.row == 16) {
        cell.textLabel.text = @"season";
        cell.detailTextLabel.text = contest.season;
    }
    
    if (cell.detailTextLabel.text == nil) {
        cell.detailTextLabel.text = @"None";
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
