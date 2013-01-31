//
//  SubscriberViewController_iPhone.m
//  Leeva
//
//  Created by Adelino Faria on 7/27/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SubscriberViewController_iPhone.h"
#import "SubscriberAddViewController_iPhone.h"
#import "LeevaColor.h"


@implementation SubscriberViewController_iPhone

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

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    view.autoresizesSubviews = YES;
    self.view = view;
    
    self.title = NSLocalizedString(@"subscriber_title", @"");
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.tintColor = [UIColor leevaBarBackgroundColor];
    toolbar.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    toolbar.layer.shadowOpacity = 0.5;
    toolbar.layer.shadowRadius = 0.5;
    toolbar.layer.shouldRasterize = YES;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.f];
    label.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor leevaValueColor3];
    label.layer.shadowColor = [UIColor whiteColor].CGColor;
    label.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    label.layer.shadowOpacity = 0.5;
    label.layer.shadowRadius = 0.5;
    label.layer.shouldRasterize = YES;
    label.text = self.title;
    [toolbar addSubview:label];
    
    UISearchBar *_searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 44, 320, 44)];
    _searchBar.tintColor = [UIColor leevaDetailBarBackgroundColor];
    _searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    _searchBar.keyboardType = UIKeyboardTypeEmailAddress;
    _searchBar.delegate = self;
    self.searchBar = _searchBar;
    
    [view addSubview:self.searchBar];
    
    UITableViewController *_subscriberTableViewController = [[UITableViewController  alloc] initWithStyle:UITableViewStylePlain];
    _subscriberTableViewController.tableView.frame = CGRectMake(0, 88, 320, 480-88);
    _subscriberTableViewController.tableView.backgroundColor = [UIColor clearColor];
    _subscriberTableViewController.tableView.separatorColor = [UIColor leevaBarBackgroundColor];
    _subscriberTableViewController.tableView.dataSource = self;
    _subscriberTableViewController.tableView.delegate = self;
    self.subscriberTableViewController = _subscriberTableViewController;
    
    CGSize noResultsSize = [NSLocalizedString(@"no_results", @"") sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0]];
    
    UILabel *_noResults = [[UILabel alloc] initWithFrame:CGRectMake(160-((noResultsSize.width+10)/2), 324, noResultsSize.width+20, 40)];
    _noResults.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
    _noResults.text = NSLocalizedString(@"no_results", @"");
    _noResults.textAlignment = UITextAlignmentCenter;
    _noResults.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    _noResults.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diagonal_pattern.png"]];
    _noResults.layer.cornerRadius = 5.0;
    _noResults.layer.masksToBounds = NO;
    _noResults.layer.shadowColor =[UIColor blackColor].CGColor;
    _noResults.layer.shadowOffset = CGSizeMake(0, 1.0);
    _noResults.layer.shadowRadius = 1.0;
    _noResults.layer.shadowOpacity = 0.5;
    self.noResults = _noResults;
    
    [self.view addSubview:self.subscriberTableViewController.tableView];
    [self.view addSubview:self.noResults];
    [self.view addSubview:toolbar];
    
    [view release];
    [toolbar release];
    [label release];
    [_searchBar release];
}

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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SubscriberAddViewController_iPhone *addSubscriber = [[SubscriberAddViewController_iPhone alloc] initWithNibName:nil bundle:nil];
        
        [self presentModalViewController:addSubscriber animated:YES];
        
        [addSubscriber setEmail:self.searchBar.text];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
