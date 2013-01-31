//
//  CampaignDetailsViewController.m
//  Leeva
//
//  Created by Adelino Faria on 4/12/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CampaignDetailsViewController.h"
#import "LeevaColor.h"


@implementation CampaignDetailsViewController

@synthesize campaign=_campaign;
@synthesize tableHeader=_tableHeader;
@synthesize detailsTableViewController=_detailsTableViewController;

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
    
    self.title = _campaign.campaignName;
    
    UIView *indexBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 34)];
    indexBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    indexBar.layer.backgroundColor = [UIColor leevaDetailBarBackgroundColor].CGColor;
    indexBar.layer.shadowOffset = CGSizeMake(0.0, 0.5);
    indexBar.layer.shadowOpacity = 1.0;
    indexBar.layer.shadowRadius = 0.5;
    
    UILabel *column1 = [[UILabel alloc] initWithFrame:indexBar.frame];
    column1.textColor = [UIColor leevaValueColor2];
    column1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column1.backgroundColor = [UIColor clearColor];
    column1.textAlignment = UITextAlignmentCenter;
    [indexBar addSubview:column1];
    
    if ([_campaign.campaignStatus isEqualToString:@"Sent"]) {
        
        column1.text = _campaign.sendProcessFinishedOn;
    }
    else {
        if ([_campaign.campaignStatus isEqualToString:@"Draft"])
            column1.text = NSLocalizedString(@"campaign_draft", @"");
        if ([_campaign.campaignStatus isEqualToString:@"Ready"])
            column1.text = NSLocalizedString(@"campaign_ready", @"");
        if ([_campaign.campaignStatus isEqualToString:@"Sending"])
            column1.text = NSLocalizedString(@"campaign_sending", @"");
        if ([_campaign.campaignStatus isEqualToString:@"Paused"])
            column1.text = NSLocalizedString(@"campaign_paused", @"");
        if ([_campaign.campaignStatus isEqualToString:@"Pending Approval"])
            column1.text = NSLocalizedString(@"campaign_pending", @"");
        if ([_campaign.campaignStatus isEqualToString:@"Failed"])
            column1.text = NSLocalizedString(@"campaign_failed", @"");
    }
    
    _detailsTableViewController = [[UITableViewController  alloc] initWithStyle:UITableViewStylePlain];
    _detailsTableViewController.tableView.frame = CGRectMake(0, 34, 320, 480-34);
    _detailsTableViewController.tableView.contentInset = UIEdgeInsetsMake(5, 0, 5, 0);
    _detailsTableViewController.tableView.delegate = self;
    _detailsTableViewController.tableView.dataSource = self;
    _detailsTableViewController.tableView.backgroundColor = [UIColor clearColor];
    _detailsTableViewController.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
    _tableHeader.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _tableHeader.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    
    CALayer *borderLayer = [CALayer layer];
    borderLayer.frame = CGRectMake(35, 15, 250, 60);
    borderLayer.borderColor = [UIColor leevaElementBorderColor].CGColor;
    borderLayer.cornerRadius = 5.0;
    borderLayer.borderWidth = 1.0;
    [_tableHeader.layer addSublayer:borderLayer];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(35, 15, 250, 60);
    maskLayer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    maskLayer.cornerRadius = 5.0;
    _tableHeader.layer.mask = maskLayer;
    
    
    UILabel *labelSent = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, _tableHeader.frame.size.width*0.5-40, 30)];
    labelSent.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
    labelSent.textColor = [UIColor leevaValueColor1];
    labelSent.backgroundColor = [UIColor clearColor];
    labelSent.textAlignment = UITextAlignmentCenter;
    labelSent.text = NSLocalizedString(@"campaign_details_sent", @"");
    [_tableHeader addSubview:labelSent];
    
    UILabel *labelSentValue = [[UILabel alloc] initWithFrame:CGRectMake(40, 35, _tableHeader.frame.size.width*0.5-40, 50)];
    labelSentValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24.0];
    labelSentValue.textColor = [UIColor leevaValueColor2];
    labelSentValue.backgroundColor = [UIColor clearColor];
    labelSentValue.textAlignment = UITextAlignmentCenter;
    [_tableHeader addSubview:labelSentValue];
    
    if (_campaign)
        labelSentValue.text = _campaign.totalSent;
    
    UILabel *labelOpen = [[UILabel alloc] initWithFrame:CGRectMake(_tableHeader.frame.size.width*0.5, 15, _tableHeader.frame.size.width*0.5-40, 30)];
    labelOpen.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
    labelOpen.textColor = [UIColor leevaValueColor1];
    labelOpen.backgroundColor = [UIColor clearColor];
    labelOpen.textAlignment = UITextAlignmentCenter;
    labelOpen.text = NSLocalizedString(@"campaign_details_opens", @"");
    [_tableHeader addSubview:labelOpen];
    
    UILabel *labelOpenValue = [[UILabel alloc] initWithFrame:CGRectMake(_tableHeader.frame.size.width*0.5, 35, _tableHeader.frame.size.width*0.5-40, 50)];
    labelOpenValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24.0];
    labelOpenValue.textColor = [UIColor leevaValueColor3];
    labelOpenValue.backgroundColor = [UIColor clearColor];
    labelOpenValue.textAlignment = UITextAlignmentCenter;
    [_tableHeader addSubview:labelOpenValue];
    
    if (_campaign)
        labelOpenValue.text = [NSString stringWithFormat:@"%d%%", [_campaign getOpensPercentage]];
    
    [self.view addSubview:_detailsTableViewController.tableView];
    [self.view addSubview:indexBar];
    _detailsTableViewController.tableView.tableHeaderView = _tableHeader;
    
    [labelSent release];
    [labelSentValue release];
    [labelOpen release];
    [labelOpenValue release];
    [column1 release];
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
    
    [_detailsTableViewController viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)setCampaign:(Campaign *)campaign
{
    if (_campaign != campaign)
    {
        [_campaign release];
        _campaign = campaign;
        [_campaign retain];
    }
    
    self.navigationItem.title = _campaign.campaignName;
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
    return 6;
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
        
        UILabel *detailName = [[UILabel alloc] initWithFrame:CGRectMake(20, 12, 170, 20)];
        detailName.textColor = [UIColor leevaValueColor1];
        detailName.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
        detailName.backgroundColor = [UIColor clearColor];
        detailName.textAlignment = UITextAlignmentLeft;
        [cell.contentView addSubview:detailName];
        
        UILabel *detailValue = [[UILabel alloc] initWithFrame:CGRectMake(190, 12, 90, 20)];
        detailValue.textColor = [UIColor leevaValueColor3];
        detailValue.font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
        detailValue.backgroundColor = [UIColor clearColor];
        detailValue.textAlignment = UITextAlignmentRight;
        detailValue.tag=1;
        [cell.contentView addSubview:detailValue];
        
        UILabel *uniqueDetailName = [[UILabel alloc] initWithFrame:CGRectMake(20, 32, 170, 10)];
        uniqueDetailName.textColor = [UIColor leevaValueColor4];
        uniqueDetailName.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0];
        uniqueDetailName.backgroundColor = [UIColor clearColor];
        uniqueDetailName.textAlignment = UITextAlignmentLeft;
        [cell.contentView addSubview:uniqueDetailName];
        
        UILabel *uniqueDetailValue = [[UILabel alloc] initWithFrame:CGRectMake(190, 32, 90, 10)];
        uniqueDetailValue.textColor = [UIColor leevaValueColor4];
        uniqueDetailValue.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
        uniqueDetailValue.backgroundColor = [UIColor clearColor];
        uniqueDetailValue.textAlignment = UITextAlignmentRight;
        uniqueDetailValue.tag=2;
        [cell.contentView addSubview:uniqueDetailValue];
        
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosureIndicator.png"]];
        image.frame = CGRectMake(290, 17, 9, 13);
        image.tag=3;
        [cell.contentView addSubview:image];
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(10, 1, 300, 44)];
        selectedBackgroundView.layer.backgroundColor = [UIColor leevaElementSelectedColor].CGColor;
        selectedBackgroundView.layer.cornerRadius = 5.0;
        cell.selectedBackgroundView = selectedBackgroundView;
        
        switch (indexPath.row) {
            case 0:
                detailName.text = NSLocalizedString(@"campaign_details_opens", @"");
                uniqueDetailName.text = NSLocalizedString(@"campaign_details_unique_opens", @"");
                break;
            case 1:
                detailName.text = NSLocalizedString(@"campaign_details_clicks", @"");
                uniqueDetailName.text = NSLocalizedString(@"campaign_details_unique_clicks", @"");
                break;
            case 2:
                detailName.text = NSLocalizedString(@"campaign_details_forwards", @"");
                uniqueDetailName.text = NSLocalizedString(@"campaign_details_unique_forwards", @"");
                break;
            case 3:
                detailName.text = NSLocalizedString(@"campaign_details_browser_views", @"");
                uniqueDetailName.text = NSLocalizedString(@"campaign_details_unique_browser_views", @"");
                break;
            case 4:
                detailName.text = NSLocalizedString(@"campaign_details_removals", @"");
                break;
            case 5:
                detailName.text = NSLocalizedString(@"campaign_details_bounces", @"");
                image.hidden = YES;
                cell.userInteractionEnabled = NO;
                break;
                
            default:
                break;
        }
        
        [selectedBackgroundView release];
        [image release];   
        [detailName release];
        [detailValue release];
        [uniqueDetailName release];
        [uniqueDetailValue release];
    }
    
    switch (indexPath.row) {
        case 0:
            if ([_campaign.totalOpens isEqualToString:@"0"]) {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = @"0";
                ((UILabel *)[cell.contentView viewWithTag:2]).text = @"0";
                ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                cell.userInteractionEnabled = NO;
            }
            else {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = _campaign.totalOpens;
                ((UILabel *)[cell.contentView viewWithTag:2]).text = _campaign.uniqueOpens;
                
                if ([[LeevaFacade instance].person isMemberOfClass:[Admin class]] || [[LeevaFacade instance].person isMemberOfClass:[User class]]) {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = NO;
                    cell.userInteractionEnabled = YES;
                } else {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                    cell.userInteractionEnabled = NO;
                }
            }
            break;
        case 1:
            if ([_campaign.totalClicks isEqualToString:@"0"]) {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = @"0";
                ((UILabel *)[cell.contentView viewWithTag:2]).text = @"0";
                ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                cell.userInteractionEnabled = NO;
            }
            else {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = _campaign.totalClicks;
                ((UILabel *)[cell.contentView viewWithTag:2]).text = _campaign.uniqueClicks;
                
                if ([[LeevaFacade instance].person isMemberOfClass:[Admin class]] || [[LeevaFacade instance].person isMemberOfClass:[User class]]) {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = NO;
                    cell.userInteractionEnabled = YES;
                } else {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                    cell.userInteractionEnabled = NO;
                }
            }
            break;
        case 2:
            if ([_campaign.totalForwards isEqualToString:@"0"]) {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = @"0";
                ((UILabel *)[cell.contentView viewWithTag:2]).text = @"0";
                ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                cell.userInteractionEnabled = NO;
            }
            else {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = _campaign.totalForwards;
                ((UILabel *)[cell.contentView viewWithTag:2]).text = _campaign.uniqueForwards;
                
                if ([[LeevaFacade instance].person isMemberOfClass:[Admin class]] || [[LeevaFacade instance].person isMemberOfClass:[User class]]) {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = NO;
                    cell.userInteractionEnabled = YES;
                } else {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                    cell.userInteractionEnabled = NO;
                }
            }
            break;
        case 3:
            if ([_campaign.totalViewsOnBrowser isEqualToString:@"0"]) {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = @"0";
                ((UILabel *)[cell.contentView viewWithTag:2]).text = @"0";
                ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                cell.userInteractionEnabled = NO;
            }
            else {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = _campaign.totalViewsOnBrowser;
                ((UILabel *)[cell.contentView viewWithTag:2]).text = _campaign.uniqueViewsOnBrowser;
                
                if ([[LeevaFacade instance].person isMemberOfClass:[Admin class]] || [[LeevaFacade instance].person isMemberOfClass:[User class]]) {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = NO;
                    cell.userInteractionEnabled = YES;
                } else {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                    cell.userInteractionEnabled = NO;
                }
            }
            break;
        case 4:
            if ([_campaign.totalUnsubscriptions isEqualToString:@"0"]) {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = @"0";
                ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                cell.userInteractionEnabled = NO;
            }
            else {
                ((UILabel *)[cell.contentView viewWithTag:1]).text = _campaign.totalUnsubscriptions;
                
                if ([[LeevaFacade instance].person isMemberOfClass:[Admin class]] || [[LeevaFacade instance].person isMemberOfClass:[User class]]) {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = NO;
                    cell.userInteractionEnabled = YES;
                } else {
                    ((UIImageView *)[cell.contentView viewWithTag:3]).hidden = YES;
                    cell.userInteractionEnabled = NO;
                }
            }
            break;
        case 5:
            ((UILabel *)[cell.contentView viewWithTag:1]).text = [NSString stringWithFormat:@"%d", ([_campaign.totalSoftBounces intValue] + [_campaign.totalHardBounces intValue])];
            break;
            
        default:
            break;
    }
    
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
 // Return NO if you do not w
 ant the item to be re-orderable.
 return YES;
 }
 */

@end
