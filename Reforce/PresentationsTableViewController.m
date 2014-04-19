//
//  PresentationsTableViewController.m
//  Reforce
//
//  Created by Akhil Stanislavose on 18/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "PresentationsTableViewController.h"
#import "PresentationViewController.h"

#import "Presentation.h"

@interface PresentationsTableViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PresentationsTableViewController {
    NSMutableArray *_presentations;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self.tableView setSeparatorInset:UIEdgeInsetsZero];

    _presentations = [[Presentation all] mutableCopy];

    [Presentation setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)newPresentaionUploaded:(Presentation *) presentation {
    [_presentations insertObject:presentation atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_presentations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [[_presentations objectAtIndex:indexPath.row] title];
    [cell setBackgroundColor:[UIColor blackColor]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    cell.textLabel.font = [UIFont systemFontOfSize:14.0];

    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithRed:(247/255.0) green:(187/255.0) blue:(17/255.0) alpha:0.6];
    cell.selectedBackgroundView = selectionColor;
    cell.separatorInset = UIEdgeInsetsZero;

    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[_presentations objectAtIndex:indexPath.row] destroy];
        [_presentations removeObjectAtIndex:indexPath.row];

        [tableView cellForRowAtIndexPath:indexPath].alpha = 0.0;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    [(PresentationViewController *)[segue destinationViewController] setPresentation:[_presentations objectAtIndex:indexPath.row]];
}

@end
