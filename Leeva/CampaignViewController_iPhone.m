//
//  CampaignViewController_iPhone.m
//  Leeva
//
//  Created by Adelino Faria on 4/11/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "CampaignViewController_iPhone.h"
#import "CampaignDetailsViewController_iPhone.h"


@implementation CampaignViewController_iPhone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.campaignNavigationController pushViewController:self animated:NO];
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
- (void)loadView {
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
    
    CampaignDetailsViewController_iPhone *detailViewController = [[CampaignDetailsViewController_iPhone alloc] initWithNibName:nil bundle:nil];
    detailViewController.campaign = [self.itemsList objectAtIndex:indexPath.row];
    
    [self.campaignNavigationController pushViewController:detailViewController animated:YES];
    
    [detailViewController release];
}

@end
