//
//  ListViewController_iPad.m
//  Leeva
//
//  Created by Adelino Faria on 4/11/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "ListViewController_iPad.h"
#import "ListDetailsViewController_iPad.h"


@implementation ListViewController_iPad

@synthesize listSplitViewController=_listSplitViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIViewController *detailViewController = [[UIViewController alloc] init];
        detailViewController.navigationItem.title = @"Details";
        
        [self.listNavigationController pushViewController:detailViewController animated:NO];
        
        [detailViewController release];
        
        _listSplitViewController = [[UISplitViewController alloc] init];
        _listSplitViewController.tabBarItem = self.tabBarItem;
        _listSplitViewController.viewControllers = [NSArray arrayWithObjects:self, self.listNavigationController, nil];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSString *cellText;
    
    if ([self.itemsList count] == 0)
    {
        if (indexPath.row == 2)
        {
            cellText = NSLocalizedString(@"no_results", @"");
            cell.textLabel.textAlignment = UITextAlignmentCenter;
            cell.textLabel.textColor = [UIColor grayColor];
        }
        else
            cellText = @"";
    }
    else
    {
        cellText = ((List *)[self.itemsList objectAtIndex:indexPath.row]).name;
        cell.textLabel.textAlignment = UITextAlignmentLeft;
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    cell.textLabel.text = cellText;
    
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
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    ListDetailsViewController_iPad *detailViewController = [[ListDetailsViewController_iPad alloc] initWithNibName:nil bundle:nil];
    
    // ...
    // Pass the selected object to the new view controller.
    detailViewController.list = [self.itemsList objectAtIndex:indexPath.row];
    
    [self.listNavigationController setViewControllers:[NSArray arrayWithObject:detailViewController] animated:NO];
    
    [detailViewController release];
}

@end
