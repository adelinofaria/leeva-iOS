//
//  RootTabBarViewController_iPad.m
//  Leeva
//
//  Created by Adelino Faria on 4/7/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "RootTabBarViewController_iPad.h"
#import "OverviewViewController_iPad.h"
#import "CampaignViewController_iPad.h"
#import "ListViewController_iPad.h"


@implementation RootTabBarViewController_iPad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
        
        OverviewViewController_iPad *overview = [[OverviewViewController_iPad alloc] initWithNibName:nil bundle:nil];
        self.overviewViewController  = overview;
        
        CampaignViewController_iPad *campaign = [[CampaignViewController_iPad alloc] initWithNibName:nil bundle:nil];
        self.campaignViewController  = campaign;
        
        ListViewController_iPad *list = [[ListViewController_iPad alloc] initWithNibName:nil bundle:nil];
        self.listViewController  = list;
        
        NSArray *viewControllers = [NSArray arrayWithObjects:overview, campaign.campaignSplitViewController, list.listSplitViewController, nil];
        self.viewControllers = viewControllers;
        
        [overview release];
        [campaign release];
        [list release];
        
        [viewControllers release];
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

@end
