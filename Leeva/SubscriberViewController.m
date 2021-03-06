//
//  SubscriberViewController.m
//  Leeva
//
//  Created by Adelino Faria on 7/27/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SubscriberViewController.h"
#import "LeevaColor.h"


@implementation SubscriberViewController

static int maxRows = 25;
static int lastPageRequested;
static NSString *lastSearchedToken;

@synthesize searchResults=_searchResults;

@synthesize noResults=_noResults;
@synthesize searchBar=_searchBar;
@synthesize subscriberTableViewController=_subscriberTableViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage* image = [UIImage imageNamed:@"subscriber.png"];
        UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"subscriber_tab_title", @"") image:image tag:1];
        self.tabBarItem = item;
        [item release];
        
        _searchResults = [[NSMutableArray alloc] init];
        
        [[LeevaFacade instance] getLists:self];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    if ([self.searchResults count] == 0)
        _noResults.hidden = NO;
    else
        _noResults.hidden = YES;
    
    if ([self.searchResults count]+1 > maxRows) {
        return maxRows;
    }
    else
        return [self.searchResults count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
        cell.contentView.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
        
        cell.textLabel.textColor = [UIColor leevaValueColor1];
        
        cell.detailTextLabel.textColor = [UIColor leevaValueColor1];
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@" +   %@", NSLocalizedString(@"subscriber_add_row", @"")];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
        cell.detailTextLabel.text = @"";
    } else {
        cell.textLabel.text = [[self.searchResults objectAtIndex:indexPath.row-1] valueForKey:@"EmailAddress"];
        cell.detailTextLabel.text = [[self.searchResults objectAtIndex:indexPath.row-1] valueForKey:@"Name"];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    if ([self.searchResults count] >= maxRows && y > h) {
        maxRows += 25;
        [_subscriberTableViewController.tableView reloadData];
        if ([self.searchResults count] < maxRows) {
            for (NSString *string in [[LeevaFacade instance].lists valueForKey:@"ListID"]) {
                [[LeevaFacade instance] searchSubscribers:self.searchBar.text listID:string recordsFrom:[NSString stringWithFormat:@"%d", lastPageRequested] recordsPerRequest:@"25" delegate:self];
                lastPageRequested += 25;
            }
        }
    }
}

#pragma mark UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    
    for (UIView *view in searchBar.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [((UIButton *)view) setTitleColor:[UIColor leevaValueColor2] forState:UIControlStateNormal];
        }
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    searchBar.text = @"";
    lastSearchedToken = @"";
    
    [self.searchResults removeAllObjects];
    [self.subscriberTableViewController.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    if([searchBar.text isEqualToString:@""] || searchBar.text==nil){
        [self.searchResults removeAllObjects];
        [self.subscriberTableViewController.tableView reloadData];
        return;
    }
    
    lastSearchedToken = [NSString stringWithFormat:@"[[EmailAddress]||[Contains]||[%@]]", searchBar.text];
    [lastSearchedToken retain];
    
    [self.searchResults removeAllObjects];
    [self.subscriberTableViewController.tableView reloadData];
    
    lastPageRequested = 25;
    
    for (NSString *string in [[LeevaFacade instance].lists valueForKey:@"ListID"]) {
        [[LeevaFacade instance] searchSubscribers:searchBar.text listID:string recordsFrom:@"0" recordsPerRequest:@"25" delegate:self];
    }
}

#pragma mark - LeevaReturn Delegate

- (void)leevaResult:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary
{
    if (result != nil && [result valueForKey:@"Success"] != nil)
    {
        NSString *command = [dictionary valueForKey:@"Command"];
        
        if ([[result valueForKey:@"Success"] boolValue])
        {
            if (command == @"Lists.Get")
            {
                if (![[result objectForKey:@"TotalLists"] isEqualToString:@"0"])
                {
                    [LeevaFacade instance].lists = [result objectForKey:@"Lists"];
                }
                else
                {
                    NSMutableArray *listIDs = [[NSMutableArray alloc] init];
                    
                    [LeevaFacade instance].lists = listIDs;
                    
                    [listIDs release];
                }
            }
            if (command == @"Subscribers.Search")
            {
                if ([lastSearchedToken isEqualToString:[dictionary valueForKey:@"Rules"]]) {
                    for (NSDictionary *list in [LeevaFacade instance].lists) {
                        if ([[list objectForKey:@"ListID"] isEqualToString:[dictionary valueForKey:@"ListID"]]) {
                            for (NSDictionary *subscriber in [result valueForKey:@"Subscribers"]) {
                                [self.searchResults addObject:[NSDictionary dictionaryWithObjectsAndKeys:[subscriber objectForKey:@"EmailAddress"], @"EmailAddress", [list objectForKey:@"Name"], @"Name",nil]];
                            }
                            break;
                        }
                    }
                    
                    [self.subscriberTableViewController.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
                }
            }
        }
        else
        {
            if (command == @"Lists.Get") {
                if ([[result valueForKey:@"ErrorCode"] intValue] == 99998)
                {
                    [[LeevaFacade instance] loginWithExistingCredentials:self];
                }
                else
                    [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"subscriber_title", @"") message:NSLocalizedString(@"error_failed_get_info", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
            }
        }
    }
    else
    {
        [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"error_no_connection_title", @"") message:NSLocalizedString(@"error_no_connection", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
    }
}

@end
