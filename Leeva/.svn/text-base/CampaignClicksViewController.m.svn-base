//
//  CampaignClicksViewController.m
//  Leeva
//
//  Created by Adelino Faria on 5/9/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CampaignClicksViewController.h"
#import "LeevaColor.h"


@implementation CampaignClicksViewController

static int maxRows;

@synthesize campaign=_campaign;
@synthesize tableHeader=_tableHeader;
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
    [_campaign release];
    [_tableHeader release];
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
    
    self.title = NSLocalizedString(@"campaign_details_clicks", @"");
    
    UIView *indexBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 34)];
    indexBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    indexBar.layer.backgroundColor = [UIColor leevaDetailBarBackgroundColor].CGColor;
    indexBar.layer.shadowOffset = CGSizeMake(0.0, 0.5);
    indexBar.layer.shadowOpacity = 1.0;
    indexBar.layer.shadowRadius = 0.5;
    indexBar.tag = 1;
    
    CGSize size1 = [NSLocalizedString(@"campaign_clicks_bar_column1_1", @"") sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0]];
    //CGSize size2 = [NSLocalizedString(@"campaign_clicks_bar_column1_2", @"") sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0]];
    
    UIButton *column1Button1 =  [UIButton buttonWithType:UIButtonTypeCustom];
    column1Button1.frame = CGRectMake(20, 6, size1.width+20, 28);
    [column1Button1 addTarget:self action:@selector(changeListTab) forControlEvents:UIControlEventTouchUpInside];
    [column1Button1 setTitle:NSLocalizedString(@"campaign_clicks_bar_column1_1", @"") forState:UIControlStateNormal];
    [column1Button1 setTitleColor:[UIColor leevaValueColor1] forState:UIControlStateNormal];
    [column1Button1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    column1Button1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column1Button1.backgroundColor = [UIColor leevaDetailBarBackgroundColor];
    column1Button1.layer.masksToBounds = NO;
    /*column1Button1.layer.shadowColor = [UIColor blackColor].CGColor;
    column1Button1.layer.shadowOffset = CGSizeMake(0, 0.5);
    column1Button1.layer.shadowRadius = 0.5;
    column1Button1.layer.shadowOpacity = 1.0;
    column1Button1.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.6].CGColor;
    column1Button1.layer.borderWidth = 1.5;*/
    column1Button1.tag = 2;
    /*
    UIButton *column1Button2 =  [UIButton buttonWithType:UIButtonTypeCustom];
    column1Button2.frame = CGRectMake(size1.width-size2.width+40, 6, size2.width+20, 28);
    [column1Button2 addTarget:self action:@selector(changeListTab) forControlEvents:UIControlEventTouchUpInside];
    [column1Button2 setTitle:NSLocalizedString(@"campaign_clicks_bar_column1_2", @"") forState:UIControlStateNormal];
    [column1Button2 setTitleColor:[UIColor leevaValueColor1] forState:UIControlStateNormal];
    [column1Button2 setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -5)];
    column1Button2.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column1Button2.backgroundColor = [UIColor leevaDetailBarBackgroundColor];
    column1Button2.layer.masksToBounds = NO;
    column1Button2.layer.shadowColor = [UIColor blackColor].CGColor;
    column1Button2.layer.shadowOffset = CGSizeMake(0, 0.5);
    column1Button2.layer.shadowRadius = 0.5;
    column1Button2.layer.shadowOpacity = 1.0;
    column1Button2.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.6].CGColor;
    column1Button2.layer.borderWidth = 1.5;
    column1Button2.tag = 3;
    
    [indexBar addSubview:column1Button2];*/
    [indexBar addSubview:column1Button1];
    
    UILabel *column2 = [[UILabel alloc] initWithFrame:CGRectMake(indexBar.frame.size.width*0.45+20, 0, indexBar.frame.size.width*0.45-10, 34)];
    column2.textColor = [UIColor leevaValueColor3];
    column2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column2.text = NSLocalizedString(@"campaign_clicks_bar_column2", @"");
    column2.backgroundColor = [UIColor clearColor];
    column2.textAlignment = UITextAlignmentRight;
    [indexBar addSubview:column2];
    
    _detailsTableViewController = [[UITableViewController  alloc] initWithStyle:UITableViewStylePlain];
    _detailsTableViewController.tableView.frame = CGRectMake(0, 34, 320, 480-34);
    _detailsTableViewController.tableView.contentInset = UIEdgeInsetsMake(5, 0, 5, 0);
    _detailsTableViewController.tableView.delegate = self;
    _detailsTableViewController.tableView.dataSource = self;
    _detailsTableViewController.tableView.backgroundColor = [UIColor clearColor];
    _detailsTableViewController.tableView.separatorColor = [UIColor leevaBarBackgroundColor];
    
    _tableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
    _tableHeader.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _tableHeader.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    
    CALayer *borderLayer = [CALayer layer];
    borderLayer.frame = CGRectMake(25, 15, 270, 60);
    borderLayer.borderColor = [UIColor leevaElementBorderColor].CGColor;
    borderLayer.cornerRadius = 5.0;
    borderLayer.borderWidth = 1.0;
    [_tableHeader.layer addSublayer:borderLayer];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(25, 15, 270, 60);
    maskLayer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    maskLayer.cornerRadius = 5.0;
    _tableHeader.layer.mask = maskLayer;
    
    UILabel *labelTotal = [[UILabel alloc] initWithFrame:CGRectMake(30, 15, 65, 60)];
    labelTotal.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    labelTotal.textColor = [UIColor leevaValueColor1];
    labelTotal.backgroundColor = [UIColor clearColor];
    labelTotal.textAlignment = UITextAlignmentLeft;
    labelTotal.text = [NSString stringWithFormat:@"%@ |", NSLocalizedString(@"total", @"")];
    [_tableHeader addSubview:labelTotal];
    
    UILabel *labelTotalValue = [[UILabel alloc] initWithFrame:CGRectMake(95, 15, 105, 60)];
    labelTotalValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    labelTotalValue.textColor = [UIColor leevaValueColor2];
    labelTotalValue.backgroundColor = [UIColor clearColor];
    labelTotalValue.textAlignment = UITextAlignmentRight;
    labelTotalValue.text = _campaign.totalClicks;
    [_tableHeader addSubview:labelTotalValue];
    
    UILabel *labelUniqueValue = [[UILabel alloc] initWithFrame:CGRectMake(95, 55, 105, 20)];
    labelUniqueValue.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
    labelUniqueValue.textColor = [UIColor leevaValueColor4];
    labelUniqueValue.backgroundColor = [UIColor clearColor];
    labelUniqueValue.textAlignment = UITextAlignmentRight;
    labelUniqueValue.text = _campaign.uniqueClicks;
    [_tableHeader addSubview:labelUniqueValue];
    
    UILabel *arrow = [[UILabel alloc] initWithFrame:CGRectMake(210, 15, 15, 60)];
    arrow.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    arrow.textColor = [UIColor leevaValueColor1];
    arrow.backgroundColor = [UIColor clearColor];
    arrow.textAlignment = UITextAlignmentCenter;
    arrow.text = @">";
    [_tableHeader addSubview:arrow];
    
    UILabel *labelSecondValue = [[UILabel alloc] initWithFrame:CGRectMake(230, 15, 60, 60)];
    labelSecondValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    labelSecondValue.textColor = [UIColor leevaValueColor3];
    labelSecondValue.backgroundColor = [UIColor clearColor];
    labelSecondValue.textAlignment = UITextAlignmentRight;
    labelSecondValue.text = [NSString stringWithFormat:@"%d%%", [_campaign getClicksPercentage]];
    [_tableHeader addSubview:labelSecondValue];
    
    [self.view addSubview:_detailsTableViewController.tableView];
    [self.view addSubview:indexBar];
    _detailsTableViewController.tableView.tableHeaderView = _tableHeader;
    
    [labelTotal release];
    [labelTotalValue release];
    [labelUniqueValue release];
    [arrow release];
    [labelSecondValue release];
    [column2 release];
    [indexBar release];
    [view release];
    
    [[LeevaFacade instance] getCampaign:_campaign.campaignID retrieveStatistics:YES delegate:self];
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

- (void)setCampaign:(Campaign *)campaign
{
    if (_campaign != campaign)
    {
        [_campaign release];
        _campaign = campaign;
        [_campaign retain];
    }
}

- (void)changeListTab {
    static bool isButton1AtTop = TRUE;
    
    UIButton *column1 = (UIButton *)[[self.view viewWithTag:1]viewWithTag:2];
    UIButton *column2 = (UIButton *)[[self.view viewWithTag:1]viewWithTag:3];
    
    if (isButton1AtTop) {
        isButton1AtTop = FALSE;
        column1.layer.zPosition = 2;
        column2.layer.zPosition = 1;
    } else {
        isButton1AtTop = TRUE;
        column1.layer.zPosition = 1;
        column2.layer.zPosition = 2;
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
    if ([_campaign.clicksArray count] > maxRows) {
        return maxRows;
    }
    else
        return [_campaign.clicksArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
        cell.contentView.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textLabel.textColor = [UIColor leevaValueColor4];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
        
        
        cell.detailTextLabel.textColor = [UIColor leevaValueColor3];
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    }
    
    cell.textLabel.text = [((NSDictionary *)[_campaign.clicksArray objectAtIndex:indexPath.row]) objectForKey:@"Email"];
    cell.detailTextLabel.text = [((NSDictionary *)[_campaign.clicksArray objectAtIndex:indexPath.row]) objectForKey:@"TotalClicks"];
    
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
    
    if ([_campaign.clicksArray count] > maxRows && y > h) {
        maxRows = maxRows+25;
        [_detailsTableViewController.tableView reloadData];
    }
}

#pragma mark - Leeva Delegate

- (void)leevaResult:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary
{
    if (result != nil && [result valueForKey:@"Success"] != nil)
    {
        if ([[result valueForKey:@"Success"] boolValue])
        {
            [_campaign update:[result valueForKey:@"Campaign"]];
            [_detailsTableViewController.tableView reloadData];
        }
    }
}

@end
