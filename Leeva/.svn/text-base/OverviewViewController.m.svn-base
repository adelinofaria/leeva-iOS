//
//  OverviewViewController.m
//  Leeva
//
//  Created by Adelino Faria on 4/7/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "OverviewViewController.h"
#import "LoginViewController.h"
#import "CampaignViewController.h"
#import "LeevaColor.h"


@implementation OverviewViewController

@synthesize itemsList=_itemsList;
@synthesize noResults=_noResults;
@synthesize overviewTableViewController=_overviewTableViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIImage* image = [UIImage imageNamed:@"overview.png"];
        UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"overview_tab_title", @"") image:image tag:0];
        self.tabBarItem = item;
        [item release];
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
    
    self.title = NSLocalizedString(@"overview_title", @"");
    
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
    
    UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    logoutButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.f];
    logoutButton.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    logoutButton.titleLabel.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    logoutButton.titleLabel.layer.shadowOpacity = 1;
    logoutButton.titleLabel.layer.shadowRadius = 0.5;
    [logoutButton setTitle:NSLocalizedString(@"logout", @"") forState:UIControlStateNormal];
    [logoutButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    logoutButton.frame = CGRectMake(0, 0, [logoutButton.titleLabel.text sizeWithFont:logoutButton.titleLabel.font].width+20, 30);
    logoutButton.bounds = CGRectMake(0, 0, [logoutButton.titleLabel.text sizeWithFont:logoutButton.titleLabel.font].width+20, 30);
    logoutButton.layer.backgroundColor = [UIColor leevaButtonColor].CGColor;
    logoutButton.layer.cornerRadius = 5.0f;
    logoutButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    logoutButton.layer.borderWidth = 0.8;
    logoutButton.layer.shadowColor = [UIColor whiteColor].CGColor;
    logoutButton.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    logoutButton.layer.shadowOpacity = 0.5;
    logoutButton.layer.shadowRadius = 0.5;
    
    
    UIBarButtonItem *logout = [[UIBarButtonItem alloc] initWithCustomView:logoutButton];
    toolbar.items = [NSArray arrayWithObjects:logout, nil];
    
    _overviewTableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    _overviewTableViewController.tableView.frame = CGRectMake(0, 44, 320, self.view.bounds.size.height-44);
    _overviewTableViewController.tableView.delegate = self;
    _overviewTableViewController.tableView.dataSource = self;
    _overviewTableViewController.tableView.separatorColor = [UIColor clearColor];
    _overviewTableViewController.tableView.backgroundColor = [UIColor clearColor];
    
    CGSize noResultsSize = [NSLocalizedString(@"no_results", @"") sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0]];
    _noResults = [[UILabel alloc] initWithFrame:CGRectMake(160-((noResultsSize.width+10)/2), 320, noResultsSize.width+20, 40)];
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
    
    [self.view addSubview:_overviewTableViewController.tableView];
    [self.view addSubview:toolbar];
    
    [view release];
    [toolbar release];
    [logout release];
    [logoutButton release];
    [label release];
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[LeevaFacade instance] getCampaigns:All delegate:self];
    
    [_overviewTableViewController viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)login {
    [LoginViewController presentLoginView:self];
}

- (void)logout {
    UIAlertView *logout = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"logout", @"") message:NSLocalizedString(@"logout_message", @"") delegate:self cancelButtonTitle:NSLocalizedString(@"no", @"") otherButtonTitles:NSLocalizedString(@"yes", @""), nil];
    [logout show];
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
    
    return [self.itemsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.contentView.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
        
        CALayer *borderLayer = [CALayer layer];
        borderLayer.frame = CGRectMake(25, 5, 270, 105);
        borderLayer.borderColor = [UIColor leevaElementBorderColor].CGColor;
        borderLayer.cornerRadius = 5.0;
        borderLayer.borderWidth = 1.0;
        [cell.layer addSublayer:borderLayer];
        
        CALayer *maskLayer = [CALayer layer];
        maskLayer.frame = CGRectMake(25, 5, 270, 105);
        maskLayer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
        maskLayer.cornerRadius = 5.0;
        cell.layer.mask = maskLayer;
        
        UILabel *campaignName = [[UILabel alloc] initWithFrame:CGRectMake(35, 35, 170, 20)];
        campaignName.textColor = [UIColor leevaValueColor1];
        campaignName.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
        campaignName.backgroundColor = [UIColor clearColor];
        campaignName.textAlignment = UITextAlignmentLeft;
        campaignName.layer.shadowColor = [UIColor whiteColor].CGColor;
        campaignName.layer.shadowOffset = CGSizeMake(0.0, 0.5);
        campaignName.layer.shadowOpacity = 0.8;
        campaignName.layer.shadowRadius = 0.5;
        campaignName.layer.shouldRasterize = YES;
        campaignName.tag=1;
        [cell.contentView addSubview:campaignName];
        
        UILabel *sentValue = [[UILabel alloc] initWithFrame:CGRectMake(205, 35, 80, 20)];
        sentValue.textColor = [UIColor leevaValueColor2];
        sentValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
        sentValue.backgroundColor = [UIColor clearColor];
        sentValue.textAlignment = UITextAlignmentRight;
        sentValue.tag=2;
        [cell.contentView addSubview:sentValue];
        
        UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(35, 10, 125, 20)];
        date.textColor = [UIColor leevaValueColor2];
        date.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
        date.backgroundColor = [UIColor clearColor];
        date.textAlignment = UITextAlignmentLeft;
        date.layer.shadowColor = [UIColor whiteColor].CGColor;
        date.layer.shadowOffset = CGSizeMake(0.0, 0.5);
        date.layer.shadowOpacity = 0.8;
        date.layer.shadowRadius = 0.5;
        date.layer.shouldRasterize = YES;
        date.tag=3;
        [cell.contentView addSubview:date];
        
        UILabel *sent = [[UILabel alloc] initWithFrame:CGRectMake(160, 10, 125, 20)];
        sent.textColor = [UIColor leevaValueColor1];
        sent.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
        sent.backgroundColor = [UIColor clearColor];
        sent.textAlignment = UITextAlignmentRight;
        sent.layer.shadowColor = [UIColor whiteColor].CGColor;
        sent.layer.shadowOffset = CGSizeMake(0.0, 0.5);
        sent.layer.shadowOpacity = 0.8;
        sent.layer.shadowRadius = 0.5;
        sent.layer.shouldRasterize = YES;
        sent.tag=4;
        [cell.contentView addSubview:sent];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(50, 60, 220, 1)];
        line.layer.backgroundColor = [UIColor leevaValueColor1].CGColor;
        line.layer.shadowColor = [UIColor whiteColor].CGColor;
        line.layer.shadowOffset = CGSizeMake(0.0, 0.5);
        line.layer.shadowOpacity = 0.8;
        line.layer.shadowRadius = 0.5;
        line.layer.shouldRasterize = YES;
        [cell.contentView addSubview:line];
        
        UILabel *open = [[UILabel alloc] initWithFrame:CGRectMake(35, 65, 80, 20)];
        open.textColor = [UIColor leevaValueColor1];
        open.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
        open.backgroundColor = [UIColor clearColor];
        open.textAlignment = UITextAlignmentCenter;
        open.layer.shadowColor = [UIColor whiteColor].CGColor;
        open.layer.shadowOffset = CGSizeMake(0.0, 0.5);
        open.layer.shadowOpacity = 0.8;
        open.layer.shadowRadius = 0.5;
        open.layer.shouldRasterize = YES;
        open.tag=5;
        [cell.contentView addSubview:open];
        
        UILabel *click = [[UILabel alloc] initWithFrame:CGRectMake(100, 65, 80, 20)];
        click.textColor = [UIColor leevaValueColor1];
        click.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
        click.backgroundColor = [UIColor clearColor];
        click.textAlignment = UITextAlignmentCenter;
        click.layer.shadowColor = [UIColor whiteColor].CGColor;
        click.layer.shadowOffset = CGSizeMake(0.0, 0.5);
        click.layer.shadowOpacity = 0.8;
        click.layer.shadowRadius = 0.5;
        click.layer.shouldRasterize = YES;
        click.tag=6;
        [cell.contentView addSubview:click];
        
        UILabel *removals = [[UILabel alloc] initWithFrame:CGRectMake(185, 65, 80, 20)];
        removals.textColor = [UIColor leevaValueColor1];
        removals.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
        removals.backgroundColor = [UIColor clearColor];
        removals.textAlignment = UITextAlignmentCenter;
        removals.layer.shadowColor = [UIColor whiteColor].CGColor;
        removals.layer.shadowOffset = CGSizeMake(0.0, 0.5);
        removals.layer.shadowOpacity = 0.8;
        removals.layer.shadowRadius = 0.5;
        removals.layer.shouldRasterize = YES;
        removals.tag=7;
        [cell.contentView addSubview:removals];
        
        UILabel *openValue = [[UILabel alloc] initWithFrame:CGRectMake(100, 85, 80, 20)];
        openValue.textColor = [UIColor leevaValueColor4];
        openValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
        openValue.backgroundColor = [UIColor clearColor];
        openValue.textAlignment = UITextAlignmentCenter;
        openValue.tag=8;
        [cell.contentView addSubview:openValue];
        
        UILabel *clickValue = [[UILabel alloc] initWithFrame:CGRectMake(35, 85, 80, 20)];
        clickValue.textColor = [UIColor leevaValueColor4];
        clickValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
        clickValue.backgroundColor = [UIColor clearColor];
        clickValue.textAlignment = UITextAlignmentCenter;
        clickValue.tag=9;
        [cell.contentView addSubview:clickValue];
        
        UILabel *removeValue = [[UILabel alloc] initWithFrame:CGRectMake(185, 85, 80, 20)];
        removeValue.textColor = [UIColor leevaValueColor4];
        removeValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
        removeValue.backgroundColor = [UIColor clearColor];
        removeValue.textAlignment = UITextAlignmentCenter;
        removeValue.tag=10;
        [cell.contentView addSubview:removeValue];
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(25, 5, 270, 105)];
        selectedBackgroundView.layer.backgroundColor = [UIColor leevaElementSelectedColor].CGColor;
        selectedBackgroundView.layer.cornerRadius = 5.0;
        cell.selectedBackgroundView = selectedBackgroundView;
        
        [selectedBackgroundView release];
        [campaignName release];
        [sentValue release];
        [date release];
        [sent release];
        [line release];
        [open release];
        [click release];
        [removals release];
    }
    Campaign *campaign = (Campaign *)[_itemsList objectAtIndex:indexPath.row];
    
    ((UILabel *)[cell.contentView viewWithTag:1]).text = campaign.campaignName;
    ((UILabel *)[cell.contentView viewWithTag:2]).text = campaign.totalSent;
    
    if ([campaign.campaignStatus isEqualToString:@"Sent"]) {
        NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
        [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *sendData = [dateformater dateFromString:campaign.sendProcessFinishedOn];
        [dateformater setDateFormat:@"dd.MM.yy"];
        ((UILabel *)[cell.contentView viewWithTag:3]).text = [dateformater stringFromDate:sendData];
        
        [dateformater release];
    }
    else {
        if ([campaign.campaignStatus isEqualToString:@"Draft"])
            ((UILabel*)[cell.contentView viewWithTag:3]).text = NSLocalizedString(@"campaign_draft", @"");
        if ([campaign.campaignStatus isEqualToString:@"Ready"])
            ((UILabel*)[cell.contentView viewWithTag:3]).text = NSLocalizedString(@"campaign_ready", @"");
        if ([campaign.campaignStatus isEqualToString:@"Sending"])
            ((UILabel*)[cell.contentView viewWithTag:3]).text = NSLocalizedString(@"campaign_sending", @"");
        if ([campaign.campaignStatus isEqualToString:@"Paused"])
            ((UILabel*)[cell.contentView viewWithTag:3]).text = NSLocalizedString(@"campaign_paused", @"");
        if ([campaign.campaignStatus isEqualToString:@"Pending Approval"])
            ((UILabel*)[cell.contentView viewWithTag:3]).text = NSLocalizedString(@"campaign_pending", @"");
        if ([campaign.campaignStatus isEqualToString:@"Failed"])
            ((UILabel*)[cell.contentView viewWithTag:3]).text = NSLocalizedString(@"campaign_failed", @"");
    }
    
    ((UILabel *)[cell.contentView viewWithTag:4]).text = NSLocalizedString(@"campaign_details_sent", @"");
    ((UILabel *)[cell.contentView viewWithTag:5]).text = NSLocalizedString(@"campaign_details_opens", @"");
    ((UILabel *)[cell.contentView viewWithTag:6]).text = NSLocalizedString(@"campaign_details_clicks", @"");
    ((UILabel *)[cell.contentView viewWithTag:7]).text = NSLocalizedString(@"campaign_details_removals", @"");
    ((UILabel *)[cell.contentView viewWithTag:8]).text = campaign.uniqueClicks;
    ((UILabel *)[cell.contentView viewWithTag:9]).text = campaign.uniqueClicks;
    ((UILabel *)[cell.contentView viewWithTag:10]).text = campaign.totalUnsubscriptions;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115.0f;
}

#pragma mark - Alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
	if([title isEqualToString:NSLocalizedString(@"yes", @"")])
	{
		[alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
        [alertView release];
        
        [self login];
	}
}
                       
#pragma mark - Leeva delegate

- (void)leevaResult:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary
{
    if (result != nil && [result valueForKey:@"Success"] != nil)
    {
        NSString *command = [dictionary valueForKey:@"Command"];
        
        if ([[result valueForKey:@"Success"] boolValue])
        {
            if (command == @"Campaigns.Get")
            {
                if (![[result objectForKey:@"TotalCampaigns"] isEqualToString:@"0"])
                {
                    NSArray *campaigns = [result objectForKey:@"Campaigns"];
                    NSMutableArray *newItemsList = [[NSMutableArray alloc] init];
                    
                    int i = 0;
                    
                    do {
                        Campaign *newCampaign = [[Campaign alloc] initCampaignWithJson:[campaigns objectAtIndex:i]];
                        if ([newCampaign.campaignStatus isEqualToString:@"Sent"]) {
                            [newItemsList addObject:newCampaign];
                        }
                        [newCampaign release];
                        i++;
                    } while ([newItemsList count] < 4 && i != [campaigns count]);
                    
                    if (newItemsList)
                    {
                        [_itemsList release];
                        _itemsList = newItemsList;
                    }
                    
                    [_overviewTableViewController.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
                }
                else
                {
                    NSMutableArray *newItemsList = [[NSMutableArray alloc] init];
                    
                    if (newItemsList)
                    {
                        [_itemsList release];
                        _itemsList = newItemsList;
                    }
                    
                    [_overviewTableViewController.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
                }
            }
        }
        else
        {
            if (command == @"Campaigns.Get") {
                if ([[result valueForKey:@"ErrorCode"] intValue] == 99998)
                {
                    [[LeevaFacade instance] loginWithExistingCredentials:self];
                }
                else
                    [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"campaign_title", @"") message:NSLocalizedString(@"error_failed_get_info", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
            }
            
        }
    }
    else
    {
        [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"error_no_connection_title", @"") message:NSLocalizedString(@"error_no_connection", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
    }
}

@end
