//
//  ListDetailsViewController.m
//  Leeva
//
//  Created by Adelino Faria on 4/12/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ListDetailsViewController.h"
#import "LeevaColor.h"


@implementation ListDetailsViewController

@synthesize list=_list;
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
    [_list release];
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
    
    self.title = _list.name;
    
    UIView *indexBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 34)];
    indexBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    indexBar.layer.backgroundColor = [UIColor leevaDetailBarBackgroundColor].CGColor;
    indexBar.layer.shadowOffset = CGSizeMake(0.0, 0.5);
    indexBar.layer.shadowOpacity = 1.0;
    indexBar.layer.shadowRadius = 0.5;
    
    UILabel *column1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, indexBar.frame.size.width*0.45-20, 34)];
    column1.textColor = [UIColor leevaValueColor1];
    column1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column1.text = NSLocalizedString(@"list_details_bar_column1", @"");
    column1.backgroundColor = [UIColor clearColor];
    column1.textAlignment = UITextAlignmentLeft;
    [indexBar addSubview:column1];
    
    UILabel *column2 = [[UILabel alloc] initWithFrame:CGRectMake(indexBar.frame.size.width*0.45+20, 0, indexBar.frame.size.width*0.45-10, 34)];
    column2.textColor = [UIColor leevaValueColor3];
    column2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column2.text = NSLocalizedString(@"list_details_bar_column2", @"");
    column2.backgroundColor = [UIColor clearColor];
    column2.textAlignment = UITextAlignmentRight;
    [indexBar addSubview:column2];
    
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
    
    UILabel *labelTotalValue = [[UILabel alloc] initWithFrame:CGRectMake(95, 15, 100, 60)];
    labelTotalValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    labelTotalValue.textColor = [UIColor leevaValueColor2];
    labelTotalValue.backgroundColor = [UIColor clearColor];
    labelTotalValue.textAlignment = UITextAlignmentCenter;
    labelTotalValue.text = _list.subscriberCount;
    [_tableHeader addSubview:labelTotalValue];
    
    UILabel *arrow = [[UILabel alloc] initWithFrame:CGRectMake(195, 15, 15, 60)];
    arrow.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    arrow.textColor = [UIColor blackColor];
    arrow.backgroundColor = [UIColor clearColor];
    arrow.textAlignment = UITextAlignmentLeft;
    arrow.text = @">";
    [_tableHeader addSubview:arrow];
    
    UILabel *labelSecondValue = [[UILabel alloc] initWithFrame:CGRectMake(210, 15, 85, 60)];
    labelSecondValue.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
    labelSecondValue.textColor = [UIColor leevaValueColor3];
    labelSecondValue.backgroundColor = [UIColor clearColor];
    labelSecondValue.textAlignment = UITextAlignmentCenter;
    labelSecondValue.tag = 1;
    [_tableHeader addSubview:labelSecondValue];
    
    if (_list.totalSpamComplaints)
        labelSecondValue.text = [NSString stringWithFormat:@"%@%%", _list.totalSpamComplaints];
    else
        labelSecondValue.text = @"0%";
    
    CGSize size = [NSLocalizedString(@"list_details_spam", @"") sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0]];
    UILabel *labelDetailDescription = [[UILabel alloc] initWithFrame:CGRectMake(290-size.width, 75-size.height, size.width, size.height)];
    labelDetailDescription.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0];
    labelDetailDescription.textColor = [UIColor leevaValueColor1];
    labelDetailDescription.backgroundColor = [UIColor clearColor];
    labelDetailDescription.textAlignment = UITextAlignmentRight;
    labelDetailDescription.text = NSLocalizedString(@"list_details_spam", @"");
    [_tableHeader addSubview:labelDetailDescription];
    
    [self.view addSubview:_detailsTableViewController.tableView];
    [self.view addSubview:indexBar];
    _detailsTableViewController.tableView.tableHeaderView = _tableHeader;
    
    [labelTotal release];
    [labelTotalValue release];
    [arrow release];
    [labelSecondValue release];
    [labelDetailDescription release];
    [column1 release];
    [column2 release];
    [indexBar release];
    [view release];
    
    [[LeevaFacade instance] getList:_list.listID delegate:self];
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

- (void)setList:(List *)list
{
    if (_list != list)
    {
        [_list release];
        _list = list;
        [_list retain];
    }
    
    self.title = _list.name;
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
    if ([[LeevaFacade instance].person isMemberOfClass:[Admin class]] || [[LeevaFacade instance].person isMemberOfClass:[User class]])
        return 7;
    else
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
        
        UILabel *detailName = [[UILabel alloc] initWithFrame:CGRectMake(20, 1, 170, 44)];
        detailName.textColor = [UIColor leevaValueColor1];
        detailName.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
        detailName.backgroundColor = [UIColor clearColor];
        detailName.textAlignment = UITextAlignmentLeft;
        [cell.contentView addSubview:detailName];
        
        UILabel *detailValue = [[UILabel alloc] initWithFrame:CGRectMake(190, 1, 90, 44)];
        detailValue.textColor = [UIColor leevaValueColor3];
        detailValue.font = [UIFont fontWithName:@"HelveticaNeue" size:17.0];
        detailValue.backgroundColor = [UIColor clearColor];
        detailValue.textAlignment = UITextAlignmentRight;
        detailValue.tag=1;
        [cell.contentView addSubview:detailValue];
        
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosureIndicator.png"]];
        image.frame = CGRectMake(290, 17, 9, 13);
        image.tag=2;
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(10, 1, 300, 44)];
        selectedBackgroundView.layer.backgroundColor = [UIColor leevaElementSelectedColor].CGColor;
        selectedBackgroundView.layer.cornerRadius = 5.0;
        cell.selectedBackgroundView = selectedBackgroundView;
        
        switch (indexPath.row) {
            case 0:
                detailName.text = NSLocalizedString(@"list_details_opens", @"");
                cell.userInteractionEnabled = NO;
                break;
            case 1:
                detailName.text = NSLocalizedString(@"list_details_clicks", @"");
                cell.userInteractionEnabled = NO;
                break;
            case 2:
                detailName.text = NSLocalizedString(@"list_details_forwards", @"");
                cell.userInteractionEnabled = NO;
                break;
            case 3:
                detailName.text = NSLocalizedString(@"list_details_browser_views", @"");
                cell.userInteractionEnabled = NO;
                break;
            case 4:
                detailName.text = NSLocalizedString(@"list_details_bounces", @"");
                [cell.contentView addSubview:image];
                break;
            case 5:
                detailName.text = NSLocalizedString(@"list_details_emails", @"");
                [cell.contentView addSubview:image];
                break;
            case 6:
                detailName.text = NSLocalizedString(@"list_details_subscriber", @"");
                [cell.contentView addSubview:image];
                break;
                
            default:
                break;
        }
        
        [selectedBackgroundView release];
        [image release];   
        [detailName release];
        [detailValue release];
    }
    
    switch (indexPath.row) {
        case 0:
            ((UILabel *)[cell.contentView viewWithTag:1]).text = [NSString stringWithFormat:@"%d%%", [_list opensPercentage]];
            break;
        case 1:
            ((UILabel *)[cell.contentView viewWithTag:1]).text = [NSString stringWithFormat:@"%d%%", [_list clicksPercentage]];
            break;
        case 2:
            ((UILabel *)[cell.contentView viewWithTag:1]).text = [NSString stringWithFormat:@"%d%%", [_list forwardsPercentage]];
            break;
        case 3:
            ((UILabel *)[cell.contentView viewWithTag:1]).text = [NSString stringWithFormat:@"%d%%", [_list browserViewsPercentage]];
            break;
        case 4:
            if ([_list bouncesPercentage] == 0) {
                ((UIImageView *)[cell.contentView viewWithTag:2]).hidden = YES;
                cell.userInteractionEnabled = NO;
            }
            else {
                ((UIImageView *)[cell.contentView viewWithTag:2]).hidden = NO;
                cell.userInteractionEnabled = YES;
            }
            ((UILabel *)[cell.contentView viewWithTag:1]).text = [NSString stringWithFormat:@"%@%%", [_list bouncesPercentage]];
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

#pragma mark - Leeva Delegate

- (void)leevaResult:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary
{
    if (result != nil && [result valueForKey:@"Success"] != nil)
    {
        if ([[result valueForKey:@"Success"] boolValue])
        {
            [_list update:[result valueForKey:@"List"]];
            ((UILabel *)[_tableHeader viewWithTag:1]).text = [NSString stringWithFormat:@"%@%%", _list.totalSpamComplaints];
            [_detailsTableViewController.tableView reloadData];
        }
    }
}

@end
