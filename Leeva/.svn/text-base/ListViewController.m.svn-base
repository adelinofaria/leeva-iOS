//
//  ListViewController.m
//  Leeva
//
//  Created by Adelino Faria on 4/11/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ListViewController.h"
#import "LoginViewController.h"
#import "LeevaColor.h"


@implementation ListViewController

static int maxRows = 25;

@synthesize itemsList=_itemsList;

@synthesize noResults=_noResults;
@synthesize listTableViewController=_listTableViewController;
@synthesize listNavigationController=_listNavigationController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage* image = [UIImage imageNamed:@"list.png"];
        UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"list_tab_title", @"") image:image tag:1];
        self.tabBarItem = item;
        [item release];
        
        _itemsList = [[NSMutableArray alloc] init];
        
        _listNavigationController = [[UINavigationController alloc] init];
        _listNavigationController.navigationBar.tintColor = [UIColor leevaBarBackgroundColor];
    }
    return self;
}

- (void)dealloc
{
    [_itemsList release];
    [_listTableViewController release];
    [_listNavigationController release];
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
    
    self.title = NSLocalizedString(@"list_title", @"");
    
    UIView *indexBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 34)];
    indexBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    indexBar.layer.backgroundColor = [UIColor leevaDetailBarBackgroundColor].CGColor;
    indexBar.layer.shadowOffset = CGSizeMake(0.0, 0.5);
    indexBar.layer.shadowOpacity = 1.0;
    indexBar.layer.shadowRadius = 0.5;
    
    UILabel *column1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, indexBar.frame.size.width*0.45-20, 34)];
    column1.textColor = [UIColor leevaValueColor1];
    column1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column1.text = NSLocalizedString(@"list_bar_column1", @"");
    column1.backgroundColor = [UIColor clearColor];
    column1.textAlignment = UITextAlignmentLeft;
    [indexBar addSubview:column1];
    
    UILabel *column2 = [[UILabel alloc] initWithFrame:CGRectMake(indexBar.frame.size.width*0.45+20, 0, indexBar.frame.size.width*0.45-10, 34)];
    column2.textColor = [UIColor leevaValueColor3];
    column2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column2.text = NSLocalizedString(@"list_bar_column2", @"");
    column2.backgroundColor = [UIColor clearColor];
    column2.textAlignment = UITextAlignmentRight;
    [indexBar addSubview:column2];
    
    _listTableViewController = [[UITableViewController  alloc] initWithStyle:UITableViewStylePlain];
    _listTableViewController.tableView.frame = CGRectMake(0, 34, 320, 480-34);
    _listTableViewController.tableView.contentInset = UIEdgeInsetsMake(5, 0, 5, 0);
    _listTableViewController.tableView.delegate = self;
    _listTableViewController.tableView.dataSource = self;
    _listTableViewController.tableView.backgroundColor = [UIColor clearColor];
    _listTableViewController.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    CGSize noResultsSize = [NSLocalizedString(@"no_results", @"") sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0]];
    _noResults = [[UILabel alloc] initWithFrame:CGRectMake(160-((noResultsSize.width+10)/2), 280, noResultsSize.width+20, 40)];
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
    
    [self.view addSubview:_noResults];
    
    [self.view addSubview:_listTableViewController.tableView];
    [self.view addSubview:indexBar];
    
    [column1 release];
    [column2 release];
    [indexBar release];
    [view release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.f];
    label.autoresizingMask = (UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor leevaValueColor3];
    label.text = self.title;
    label.layer.shadowColor = [UIColor whiteColor].CGColor;
    label.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    label.layer.shadowOpacity = 0.5;
    label.layer.shadowRadius = 0.5;
    label.layer.shouldRasterize = YES;
    [label sizeToFit];
    
    self.navigationItem.titleView = label;
    
    [label release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[LeevaFacade instance] getLists:self];
    
    [_listTableViewController viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
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
    if ([self.itemsList count] == 0)
        _noResults.hidden = NO;
    else
        _noResults.hidden = YES;
    
    if ([_itemsList count] > maxRows) {
        return maxRows;
    }
    else
        return [_itemsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.contentView.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
        
        CALayer *borderLayer = [CALayer layer];
        borderLayer.frame = CGRectMake(10, 1, 300, 44);
        borderLayer.borderColor = [UIColor leevaElementBorderColor].CGColor;
        borderLayer.cornerRadius = 5.0;
        borderLayer.borderWidth = 1.0;
        [cell.layer addSublayer:borderLayer];
        
        CALayer *maskLayer = [CALayer layer];
        maskLayer.frame = CGRectMake(10, 1, 300, 44);
        maskLayer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
        maskLayer.cornerRadius = 5.0;
        cell.layer.mask = maskLayer;
        
        UILabel *listName = [[UILabel alloc] initWithFrame:CGRectMake(20, 1, 170, 44)];
        listName.textColor = [UIColor leevaValueColor1];
        listName.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
        listName.backgroundColor = [UIColor clearColor];
        listName.textAlignment = UITextAlignmentLeft;
        listName.tag=1;
        [cell.contentView addSubview:listName];
        
        UILabel *listSubscribers = [[UILabel alloc] initWithFrame:CGRectMake(190, 1, 90, 44)];
        listSubscribers.textColor = [UIColor leevaValueColor3];
        listSubscribers.font = [UIFont fontWithName:@"HelveticaNeue" size:17.0];
        listSubscribers.backgroundColor = [UIColor clearColor];
        listSubscribers.textAlignment = UITextAlignmentRight;
        listSubscribers.tag=2;
        [cell.contentView addSubview:listSubscribers];
        
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosureIndicator.png"]];
        image.frame = CGRectMake(290, 17, 9, 13);
        [cell.contentView addSubview:image];
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(10, 1, 300, 44)];
        selectedBackgroundView.layer.backgroundColor = [UIColor leevaElementSelectedColor].CGColor;
        selectedBackgroundView.layer.cornerRadius = 5.0;
        cell.selectedBackgroundView = selectedBackgroundView;
        
        [selectedBackgroundView release];
        [image release];   
        [listName release];
        [listSubscribers release];
    }
    
    List *list = (List *)[self.itemsList objectAtIndex:indexPath.row];
    
    
    ((UILabel *)[cell.contentView viewWithTag:1]).text = list.name;
    ((UILabel *)[cell.contentView viewWithTag:2]).text = list.subscriberCount;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 46.0f;
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

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    if ([_itemsList count] > maxRows && y > h) {
        maxRows = maxRows+25;
        [_listTableViewController.tableView reloadData];
    }
}

#pragma mark - Leeva Delegate

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
                    NSArray *lists = [result objectForKey:@"Lists"];
                    NSMutableArray *newItemsList = [[NSMutableArray alloc] init];
                    
                    for (NSDictionary *list in lists)
                    {
                        List *newList = [[List alloc] initListWithJson:list];
                        [newItemsList addObject:newList];
                        [newList release];
                    }
                    
                    if (newItemsList)
                    {
                        [_itemsList release];
                        _itemsList = newItemsList;
                    }
                    
                    [_listTableViewController.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
                }
                else
                {
                    NSMutableArray *newItemsList = [[NSMutableArray alloc] init];
                    
                    if (newItemsList)
                    {
                        [_itemsList release];
                        _itemsList = newItemsList;
                    }
                    
                    [_listTableViewController.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
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
                    [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"list_title", @"") message:NSLocalizedString(@"error_failed_get_info", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
            }
        }
    }
    else
    {
        [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"error_no_connection_title", @"") message:NSLocalizedString(@"error_no_connection", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
    }
}

@end
