//
//  ListViewController_iPhone.m
//  Leeva
//
//  Created by Adelino Faria on 4/11/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "ListViewController_iPhone.h"
#import "ListDetailsViewController_iPhone.h"


@implementation ListViewController_iPhone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.listNavigationController pushViewController:self animated:NO];
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
    return UIInterfaceOrientationPortrait;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListDetailsViewController_iPhone *detailViewController = [[ListDetailsViewController_iPhone alloc] initWithNibName:nil bundle:nil];
    detailViewController.list = [self.itemsList objectAtIndex:indexPath.row];
    
    [self.listNavigationController pushViewController:detailViewController animated:YES];
    
    [detailViewController release];
}

@end
