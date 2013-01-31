//
//  ListDetailsViewController_iPhone.m
//  Leeva
//
//  Created by Adelino Faria on 4/18/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "ListDetailsViewController_iPhone.h"
#import "ListBounceViewController_iPhone.h"
#import "ListEmailDomainViewController_iPhone.h"
#import "ListSubscribersViewController_iPhone.h"


@implementation ListDetailsViewController_iPhone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *nextViewController;
    switch (indexPath.row) {
        case 4:
            nextViewController = [[ListBounceViewController_iPhone alloc] initWithNibName:nil bundle:nil];
            ((ListBounceViewController_iPhone *)nextViewController).list = self.list;
            [self.navigationController pushViewController:nextViewController animated:YES];
            [nextViewController release];
            break;
        case 5:
            nextViewController = [[ListEmailDomainViewController_iPhone alloc] initWithNibName:nil bundle:nil];
            ((ListEmailDomainViewController_iPhone *)nextViewController).list = self.list;
            [self.navigationController pushViewController:nextViewController animated:YES];
            [nextViewController release];
            break;
        case 6:
            nextViewController = [[ListSubscribersViewController_iPhone alloc] initWithNibName:nil bundle:nil];
            ((ListSubscribersViewController_iPhone *)nextViewController).list = self.list;
            [self.navigationController pushViewController:nextViewController animated:YES];
            [nextViewController release];
            break;
            
        default:
            break;
    }
}

@end