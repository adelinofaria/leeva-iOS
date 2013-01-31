//
//  RootTabBarViewController.m
//  Leeva
//
//  Created by Adelino Faria on 4/7/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "OverviewViewController.h"
#import "CampaignViewController.h"
#import "ListViewController.h"
#import "LoginViewController.h"
#import "SubscriberViewController.h"


@implementation RootTabBarViewController

@synthesize overviewViewController;
@synthesize campaignViewController;
@synthesize listViewController;
@synthesize subscriberViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.delegate = self;
        
        [[LeevaFacade instance] loginWithExistingCredentials:self];
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

#pragma mark - Tab Bar Delegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        [((UINavigationController *)viewController) popToRootViewControllerAnimated:NO];
    }
    else {
        if ([viewController isKindOfClass:[UISplitViewController class]]) {
            [((UISplitViewController *)viewController).navigationController popToRootViewControllerAnimated:NO];
        }
    }
}

@end
