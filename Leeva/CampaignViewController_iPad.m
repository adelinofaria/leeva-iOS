//
//  CampaignViewController_iPad.m
//  Leeva
//
//  Created by Adelino Faria on 4/11/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "CampaignViewController_iPad.h"
#import "CampaignDetailsViewController_iPad.h"


@implementation CampaignViewController_iPad

@synthesize campaignSplitViewController=_campaignSplitViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIViewController *detailViewController = [[UIViewController alloc] init];
        detailViewController.view.backgroundColor = [UIColor clearColor];
        detailViewController.navigationItem.title = @"Details";
        
        [self.campaignNavigationController pushViewController:detailViewController animated:NO];
        
        [detailViewController release];
        
        _campaignSplitViewController = [[UISplitViewController alloc] init];
        _campaignSplitViewController.tabBarItem = self.tabBarItem;
        _campaignSplitViewController.viewControllers = [NSArray arrayWithObjects:self, self.campaignNavigationController, nil];
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    CampaignDetailsViewController_iPad *detailViewController = [[CampaignDetailsViewController_iPad alloc] initWithNibName:nil bundle:nil];
    detailViewController.campaign = [self.itemsList objectAtIndex:indexPath.row];
    
    [self.campaignNavigationController setViewControllers:[NSArray arrayWithObject:detailViewController] animated:NO];
    
    [detailViewController release];
}

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc
{
    barButtonItem.title = @"Sidebar";    
    
    UINavigationItem *navItem = [self navigationItem];
    [navItem setLeftBarButtonItem:barButtonItem animated:YES];
    
    //self.popover = pc;
}

- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    UINavigationItem *navItem = [self navigationItem];
    [navItem setLeftBarButtonItem:nil animated:YES];
    
    //self.popover = nil;
}

@end
