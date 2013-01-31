//
//  ListSubscribersViewController.m
//  Leeva
//
//  Created by Adelino Faria on 7/27/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ListSubscribersViewController.h"
#import "LeevaColor.h"


@implementation ListSubscribersViewController

static int maxRows;
static int lastPageRequested;

@synthesize list=_list;
@synthesize tableHeaderView=_tableHeaderView;
@synthesize tableFooterView=_tableFooterView;
@synthesize activityIndicator=_activityIndicator;
@synthesize detailsTableViewController=_detailsTableViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        maxRows = 25;
    }
    return self;
}

- (void)dealloc
{
    [_list release];
    [_tableHeaderView release];
    [_tableFooterView release];
    [_activityIndicator release];
    [_detailsTableViewController release];
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
    
    self.title = NSLocalizedString(@"list_details_subscriber", @"");
    
    UIView *indexBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 34)];
    indexBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    indexBar.layer.backgroundColor = [UIColor leevaDetailBarBackgroundColor].CGColor;
    indexBar.layer.shadowOffset = CGSizeMake(0.0, 0.5);
    indexBar.layer.shadowOpacity = 1.0;
    indexBar.layer.shadowRadius = 0.5;
    
    UILabel *column1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 280, 34)];
    column1.textColor = [UIColor leevaValueColor1];
    column1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column1.text = NSLocalizedString(@"list_subscriber_column1", @"");
    column1.backgroundColor = [UIColor clearColor];
    column1.textAlignment = UITextAlignmentLeft;
    [indexBar addSubview:column1];
    
    _detailsTableViewController = [[UITableViewController  alloc] initWithStyle:UITableViewStylePlain];
    _detailsTableViewController.tableView.frame = CGRectMake(0, 34, 320, 480-34);
    _detailsTableViewController.tableView.contentInset = UIEdgeInsetsMake(5, 0, 5, 0);
    _detailsTableViewController.tableView.delegate = self;
    _detailsTableViewController.tableView.dataSource = self;
    _detailsTableViewController.tableView.backgroundColor = [UIColor clearColor];
    _detailsTableViewController.tableView.separatorColor = [UIColor leevaBarBackgroundColor];
    
    _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
    _tableHeaderView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _tableHeaderView.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    
    CALayer *borderLayer = [CALayer layer];
    borderLayer.frame = CGRectMake(25, 15, 270, 60);
    borderLayer.borderColor = [UIColor leevaElementBorderColor].CGColor;
    borderLayer.cornerRadius = 5.0;
    borderLayer.borderWidth = 1.0;
    [_tableHeaderView.layer addSublayer:borderLayer];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(25, 15, 270, 60);
    maskLayer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    maskLayer.cornerRadius = 5.0;
    _tableHeaderView.layer.mask = maskLayer;
    
    UILabel *labelTotal = [[UILabel alloc] initWithFrame:CGRectMake(30, 15, 65, 60)];
    labelTotal.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    labelTotal.textColor = [UIColor leevaValueColor1];
    labelTotal.backgroundColor = [UIColor clearColor];
    labelTotal.textAlignment = UITextAlignmentLeft;
    labelTotal.text = [NSString stringWithFormat:@"%@ |", NSLocalizedString(@"total", @"")];
    [_tableHeaderView addSubview:labelTotal];
    
    UILabel *labelTotalValue = [[UILabel alloc] initWithFrame:CGRectMake(95, 15, 200, 60)];
    labelTotalValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    labelTotalValue.textColor = [UIColor leevaValueColor2];
    labelTotalValue.backgroundColor = [UIColor clearColor];
    labelTotalValue.textAlignment = UITextAlignmentCenter;
    labelTotalValue.text = _list.subscriberCount;
    [_tableHeaderView addSubview:labelTotalValue];
    
    _tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    _tableFooterView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _tableFooterView.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicator.frame = CGRectMake(150, 20, 20, 20);
    [_tableFooterView addSubview:_activityIndicator];
    
    [self.view addSubview:_detailsTableViewController.tableView];
    [self.view addSubview:indexBar];
    _detailsTableViewController.tableView.tableHeaderView = _tableHeaderView;
    _detailsTableViewController.tableView.tableFooterView = _tableFooterView;
    
    [labelTotal release];
    [labelTotalValue release];
    [column1 release];
    [indexBar release];
    [view release];
    
    lastPageRequested = 25;
    
    [[LeevaFacade instance] getSubscribers:_list.listID recordsFrom:[NSString stringWithFormat:@"%d", lastPageRequested] recordsPerRequest:@"25" delegate:self];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == YES);
}

- (void)setList:(List *)list
{
    if (_list != list)
    {
        [_list release];
        _list = list;
        [_list retain];
    }
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
    if ([_list.subscriberArray count] > maxRows) {
        return maxRows;
    }
    else
        return [_list.subscriberArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.contentView.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textLabel.textColor = [UIColor leevaValueColor4];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    }
    
    cell.textLabel.text = [[_list.subscriberArray objectAtIndex:indexPath.row] valueForKey:@"EmailAddress"];
    
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
    NSLog(@"%d", [_list.subscriberArray count]);
    NSLog(@"%d",maxRows);
    NSLog(@"%d",[_list.subscriberCount intValue]);
    if ([_list.subscriberArray count] >= maxRows && [_list.subscriberCount intValue] > maxRows && y > h) {
        maxRows += 25;
        
        [_activityIndicator startAnimating];
        
        [[LeevaFacade instance] getSubscribers:_list.listID recordsFrom:[NSString stringWithFormat:@"%d", lastPageRequested] recordsPerRequest:@"25" delegate:self];
        lastPageRequested += 25;
    }
}

#pragma mark - Leeva Delegate

- (void)leevaResult:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary
{
    if (result != nil && [result valueForKey:@"Success"] != nil)
    {
        if ([[result valueForKey:@"Success"] boolValue])
        {
            if (_list.subscriberArray) {
                [_list addSubscriberList:[_list.subscriberArray arrayByAddingObjectsFromArray:[result valueForKey:@"Subscribers"]]];
                [_detailsTableViewController.tableView reloadData];
                [_activityIndicator stopAnimating];
            } else {
                [_list addSubscriberList:[result valueForKey:@"Subscribers"]];
            }
            
            [_detailsTableViewController.tableView reloadData];
        }
    }
}

@end
