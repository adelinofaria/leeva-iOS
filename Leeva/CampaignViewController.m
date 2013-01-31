//
//  CampaignViewController.m
//  Leeva
//
//  Created by Adelino Faria on 4/13/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "CampaignViewController.h"
#import "LoginViewController.h"
#import "LeevaColor.h"


@implementation CampaignViewController

static int maxRows = 25;

@synthesize itemsList=_itemsList;

@synthesize noResults=_noResults;
@synthesize campaignTableViewController=_campaignTableViewController;
@synthesize campaignNavigationController=_campaignNavigationController;

@synthesize campaignComboBox=_campaignComboBox;
@synthesize campaignPickerView=_campaignPickerView;
@synthesize campaignPopOverPickerView=_campaignPopOverPickerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage* image = [UIImage imageNamed:@"campaign.png"];
        UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"campaign_tab_title", @"") image:image tag:1];
        self.tabBarItem = item;
        [item release];
        
        _itemsList = [[NSMutableArray alloc] init];
        
        _campaignNavigationController = [[UINavigationController alloc] init];
        _campaignNavigationController.navigationBar.tintColor = [UIColor leevaBarBackgroundColor];
    }
    return self;
}

- (void)dealloc
{
    [_itemsList release];
    [_campaignTableViewController release];
    [_campaignNavigationController release];
    [_campaignComboBox release];
    [_campaignPickerView release];
    [_campaignPopOverPickerView release];
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
    
    self.title = NSLocalizedString(@"campaign_title", @"");
    
    UIView *indexBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 34)];
    indexBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    indexBar.layer.backgroundColor = [UIColor leevaDetailBarBackgroundColor].CGColor;
    indexBar.layer.shadowOffset = CGSizeMake(0.0, 0.5);
    indexBar.layer.shadowOpacity = 1.0;
    indexBar.layer.shadowRadius = 0.5;
    
    UILabel *column1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 1, 165, 34)];
    column1.textColor = [UIColor leevaValueColor1];
    column1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column1.text = NSLocalizedString(@"campaign_bar_column1", @"");
    column1.backgroundColor = [UIColor clearColor];
    column1.textAlignment = UITextAlignmentLeft;
    [indexBar addSubview:column1];
    
    UILabel *column2 = [[UILabel alloc] initWithFrame:CGRectMake(185, 1, 55, 34)];
    column2.textColor = [UIColor leevaValueColor2];
    column2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column2.text = NSLocalizedString(@"campaign_bar_column2", @"");
    column2.backgroundColor = [UIColor clearColor];
    column2.textAlignment = UITextAlignmentCenter;
    [indexBar addSubview:column2];
    
    UILabel *column3 = [[UILabel alloc] initWithFrame:CGRectMake(240, 1, 50, 34)];
    column3.textColor = [UIColor leevaValueColor3];
    column3.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    column3.text = NSLocalizedString(@"campaign_bar_column3", @"");
    column3.backgroundColor = [UIColor clearColor];
    column3.textAlignment = UITextAlignmentRight;
    [indexBar addSubview:column3];
    
    _campaignTableViewController = [[UITableViewController  alloc] initWithStyle:UITableViewStylePlain];
    _campaignTableViewController.tableView.frame = CGRectMake(0, 34, 320, 480-34);
    _campaignTableViewController.tableView.contentInset = UIEdgeInsetsMake(5, 0, 5, 0);
    _campaignTableViewController.tableView.delegate = self;
    _campaignTableViewController.tableView.dataSource = self;
    _campaignTableViewController.tableView.backgroundColor = [UIColor clearColor];
    _campaignTableViewController.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
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
    
    [self.view addSubview:_campaignTableViewController.tableView];
    [self.view addSubview:indexBar];
    [self.view addSubview:_noResults];
    
    CGSize size = [NSLocalizedString(@"campaign_all_picker", @"") sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:11.0]];
    _campaignComboBox = [UIButton buttonWithType:UIButtonTypeCustom];
    _campaignComboBox.frame = CGRectMake(0, 0, size.width+24, 25);
    _campaignComboBox.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 10.0);
    _campaignComboBox.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    _campaignComboBox.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    _campaignComboBox.layer.shadowOpacity = 1;
    _campaignComboBox.layer.shadowRadius = 0.5;
    _campaignComboBox.layer.cornerRadius = 5.0f;
    
    [_campaignComboBox setTitleColor:[UIColor leevaValueColor2] forState:UIControlStateNormal];
    [_campaignComboBox addTarget:self action:@selector(comboBoxSelected) forControlEvents:UIControlEventTouchUpInside];
    [_campaignComboBox setTitle:NSLocalizedString(@"campaign_all_picker", @"") forState:UIControlStateNormal];
    _campaignComboBox.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11.0];
    _campaignComboBox.titleLabel.layer.shadowColor = [UIColor whiteColor].CGColor;
    _campaignComboBox.titleLabel.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    _campaignComboBox.titleLabel.layer.shadowOpacity = 0.7;
    _campaignComboBox.titleLabel.layer.shadowRadius = 0.5;
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];   
    shapeLayer.fillColor = [[UIColor leevaComboBoxArrowColor] CGColor];
    shapeLayer.frame = CGRectMake(_campaignComboBox.frame.size.width-14, 0, 14, _campaignComboBox.frame.size.height);
    shapeLayer.shadowColor = [UIColor blackColor].CGColor;
    shapeLayer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    shapeLayer.shadowOpacity = 0.75f;
    shapeLayer.shadowRadius = 0.5f;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint pathPoints[] = {{3,12}, {11,12}, {7,18}};
    CGPathAddLines(path, nil, pathPoints, 3);
    shapeLayer.path = path;
    CFRelease(path);
    
    CALayer *mask = [CALayer layer];
    mask.backgroundColor = [UIColor whiteColor].CGColor;
    mask.frame = CGRectMake(_campaignComboBox.frame.size.width-14, 0, 14, _campaignComboBox.frame.size.height);
    
    CALayer *shapeBase = [CALayer layer];
    shapeBase.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3].CGColor;
    shapeBase.frame = _campaignComboBox.frame;
    shapeBase.cornerRadius = 5.0f;
    shapeBase.mask = mask;
    [shapeBase addSublayer:shapeLayer];
    [_campaignComboBox.layer addSublayer:shapeBase];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_campaignComboBox];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    _campaignPickerView = [[UIPickerView alloc] init];
    _campaignPickerView.delegate = self;
    
    [barButtonItem release];
    [column1 release];
    [column2 release];
    [column3 release];
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
    
    [[LeevaFacade instance] getCampaigns:All delegate:self];
    
    [_campaignTableViewController viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)comboBoxSetup:(BOOL)pressed withTitle:(NSString *)title {
    CALayer *baseLayer = ((CALayer *)[_campaignComboBox.layer.sublayers objectAtIndex:1]);
    
    if (![title isEqualToString:_campaignComboBox.titleLabel.text]) {
        [_campaignComboBox setTitle:title forState:UIControlStateNormal];
        
        CGSize size = [title sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:12.0]];
        _campaignComboBox.frame = CGRectMake(0, 0, size.width+24, 25);
        
        [CATransaction begin]; 
        [CATransaction setValue: (id) kCFBooleanTrue forKey: kCATransactionDisableActions];
        
        ((CAShapeLayer *)[baseLayer.sublayers objectAtIndex:0]).frame = CGRectMake(_campaignComboBox.frame.size.width-14, 0, 14, _campaignComboBox.frame.size.height);
        baseLayer.mask.frame = CGRectMake(_campaignComboBox.frame.size.width-14, 0, 14, _campaignComboBox.frame.size.height);
        baseLayer.frame = _campaignComboBox.frame;
        
        [CATransaction commit];
    }
    
    if (pressed)
        baseLayer.backgroundColor = [UIColor clearColor].CGColor;
    else
        baseLayer.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3].CGColor;
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
        
        UILabel *column1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 1, 165, 44)];
        column1.textColor = [UIColor leevaValueColor1];
        column1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
        column1.backgroundColor = [UIColor clearColor];
        column1.textAlignment = UITextAlignmentLeft;
        column1.tag=1;
        [cell.contentView addSubview:column1];
        
        UILabel *column2 = [[UILabel alloc] initWithFrame:CGRectMake(185, 1, 55, 44)];
        column2.textColor = [UIColor leevaValueColor2];
        column2.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
        column2.backgroundColor = [UIColor clearColor];
        column2.textAlignment = UITextAlignmentCenter;
        column2.tag=2;
        [cell addSubview:column2];
        
        UILabel *column3 = [[UILabel alloc] initWithFrame:CGRectMake(240, 1, 50, 44)];
        column3.textColor = [UIColor leevaValueColor3];
        column3.font = [UIFont fontWithName:@"HelveticaNeue" size:17.0];
        column3.backgroundColor = [UIColor clearColor];
        column3.textAlignment = UITextAlignmentRight;
        column3.tag=3;
        [cell.contentView addSubview:column3];
        
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosureIndicator.png"]];
        image.frame = CGRectMake(290, 17, 9, 13);
        [cell.contentView addSubview:image];
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(10, 1, 300, 44)];
        selectedBackgroundView.layer.backgroundColor = [UIColor leevaElementSelectedColor].CGColor;
        selectedBackgroundView.layer.cornerRadius = 5.0;
        cell.selectedBackgroundView = selectedBackgroundView;
        
        [selectedBackgroundView release];
        [image release];
        [column1 release];
        [column3 release];
    }
    
    Campaign *campaign = (Campaign *)[self.itemsList objectAtIndex:indexPath.row];
    
    ((UILabel*)[cell viewWithTag:1]).text = campaign.campaignName;
    if ([campaign.campaignStatus isEqualToString:@"Sent"]) {
        NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
        [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *sendData = [dateformater dateFromString:campaign.sendProcessFinishedOn];
        [dateformater setDateFormat:@"dd.MM.yy"];
        ((UILabel*)[cell viewWithTag:2]).text = [dateformater stringFromDate:sendData];
        
        [dateformater release];
    }
    else {
        if ([campaign.campaignStatus isEqualToString:@"Draft"])
            ((UILabel*)[cell viewWithTag:2]).text = NSLocalizedString(@"campaign_draft", @"");
        if ([campaign.campaignStatus isEqualToString:@"Ready"])
            ((UILabel*)[cell viewWithTag:2]).text = NSLocalizedString(@"campaign_ready", @"");
        if ([campaign.campaignStatus isEqualToString:@"Sending"])
            ((UILabel*)[cell viewWithTag:2]).text = NSLocalizedString(@"campaign_sending", @"");
        if ([campaign.campaignStatus isEqualToString:@"Paused"])
            ((UILabel*)[cell viewWithTag:2]).text = NSLocalizedString(@"campaign_paused", @"");
        if ([campaign.campaignStatus isEqualToString:@"Pending Approval"])
            ((UILabel*)[cell viewWithTag:2]).text = NSLocalizedString(@"campaign_pending", @"");
        if ([campaign.campaignStatus isEqualToString:@"Failed"])
            ((UILabel*)[cell viewWithTag:2]).text = NSLocalizedString(@"campaign_failed", @"");
    }
    ((UILabel*)[cell viewWithTag:3]).text = [NSString stringWithFormat:@"%d%%", [campaign getOpensPercentage]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!CGAffineTransformIsIdentity(_campaignPickerView.transform))
    {
        [self comboBoxSetup:NO withTitle:_campaignComboBox.titleLabel.text];
        
        [UIView beginAnimations:@"registerScroll" context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationDuration:0.3];
        _campaignPickerView.transform = CGAffineTransformIdentity;
        [UIView commitAnimations];
    }
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    //NSLog(@"\n  %d > %d && %f > %f\ny = %f + %f - %f\nRESULT %@\n\n", [_itemsList count], maxRows, y, h, offset.y, bounds.size.height, inset.bottom, (([_itemsList count] > maxRows && y > h) ? @"YES" : @"NO"));
    
    if ([_itemsList count] > maxRows && y > h) {
        maxRows = maxRows+25;
        [_campaignTableViewController.tableView reloadData];
    }
}

#pragma mark - Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 7;
}

#pragma mark - Picker view delegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIView *rowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
    rowView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(44, 0, 320, 44)];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:24];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor leevaValueColor1];
    label.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    label.layer.shadowOffset = CGSizeMake(0.0, 0.5);
    label.layer.shadowOpacity = 1.0;
    label.layer.shadowRadius = 0.5;
    label.tag = 1;
    
    UIView *checkmark = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    checkmark.backgroundColor = [UIColor clearColor];
    checkmark.hidden = YES;
    checkmark.tag = 2;
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];   
    shapeLayer.fillColor = [[UIColor leevaValueColor2] CGColor];
    shapeLayer.frame = checkmark.frame;
    shapeLayer.shadowColor = [UIColor blackColor].CGColor;
    shapeLayer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    shapeLayer.shadowOpacity = 1.0f;
    shapeLayer.shadowRadius = 0.5f;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint pathPoints[] = {{18,22}, {22,30}, {26,30}, {36,12}, {32,12}, {24,26}, {22,22}};
    CGPathAddLines(path, nil, pathPoints, 7);
    shapeLayer.path = path;
    CFRelease(path);
    
    [checkmark.layer addSublayer:shapeLayer];
    
    
    if ([pickerView selectedRowInComponent:0] == row) {
        label.textColor = [UIColor leevaValueColor2];
        checkmark.hidden = NO;
    }
    
    switch (row) {
        case 0:
            label.text = NSLocalizedString(@"campaign_all_picker", @"");
            break;
        case 1:
            label.text = NSLocalizedString(@"campaign_sent_picker", @"");
            break;
        case 2:
            label.text = NSLocalizedString(@"campaign_ready_picker", @"");
            break;
        case 3:
            label.text = NSLocalizedString(@"campaign_draft_picker", @"");
            break;
        case 4:
            label.text = NSLocalizedString(@"campaign_scheduled_picker", @"");
            break;
        case 5:
            label.text = NSLocalizedString(@"campaign_paused_picker", @"");
            break;
        case 6:
            label.text = NSLocalizedString(@"campaign_pending_picker", @"");
            break;
            
        default:
            label.text = NSLocalizedString(@"campaign_all_picker", @"");
            break;
    }
    
    [rowView addSubview:checkmark];
    [rowView addSubview:label];
    
    return rowView;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (row) {
        case 0:
            return NSLocalizedString(@"campaign_all_picker", @"");
            break;
        case 1:
            return NSLocalizedString(@"campaign_sent_picker", @"");
            break;
        case 2:
            return NSLocalizedString(@"campaign_ready_picker", @"");
            break;
        case 3:
            return NSLocalizedString(@"campaign_draft_picker", @"");
            break;
        case 4:
            return NSLocalizedString(@"campaign_scheduled_picker", @"");
            break;
        case 5:
            return NSLocalizedString(@"campaign_paused_picker", @"");
            break;
        case 6:
            return NSLocalizedString(@"campaign_pending_picker", @"");
            break;
            
        default:
            return NSLocalizedString(@"campaign_all_picker", @"");
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (row) {
        case 0:
            if ([_campaignComboBox titleLabel].text != NSLocalizedString(@"campaign_all_picker", @"")) {
                [[LeevaFacade instance] getCampaigns:All delegate:self];
                
                NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
                [self comboBoxSetup:YES withTitle:title];
                
                [pickerView reloadComponent:0];
            }
            break;
        case 1:
            if ([_campaignComboBox titleLabel].text != NSLocalizedString(@"campaign_sent_picker", @"")) {
                [[LeevaFacade instance] getCampaigns:Sent delegate:self];
                
                NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
                [self comboBoxSetup:YES withTitle:title];
                
                [pickerView reloadComponent:0];
            }
            break;
        case 2:
            if ([_campaignComboBox titleLabel].text != NSLocalizedString(@"campaign_ready_picker", @"")) {
                [[LeevaFacade instance] getCampaigns:Sending delegate:self];
                
                NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
                [self comboBoxSetup:YES withTitle:title];
                
                [pickerView reloadComponent:0];
            }
            break;
        case 3:
            if ([_campaignComboBox titleLabel].text != NSLocalizedString(@"campaign_draft_picker", @"")) {
                [[LeevaFacade instance] getCampaigns:Draft delegate:self];
                
                NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
                [self comboBoxSetup:YES withTitle:title];
                
                [pickerView reloadComponent:0];
            }
            break;
        case 4:
            if ([_campaignComboBox titleLabel].text != NSLocalizedString(@"campaign_scheduled_picker", @"")) {
                [[LeevaFacade instance] getCampaigns:Ready delegate:self];
                
                NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
                [self comboBoxSetup:YES withTitle:title];
                
                [pickerView reloadComponent:0];
            }
            break;
        case 5:
            if ([_campaignComboBox titleLabel].text != NSLocalizedString(@"campaign_paused_picker", @"")) {
                [[LeevaFacade instance] getCampaigns:Paused delegate:self];
                
                NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
                [self comboBoxSetup:YES withTitle:title];
                
                [pickerView reloadComponent:0];
            }
            break;
        case 6:
            if ([_campaignComboBox titleLabel].text != NSLocalizedString(@"campaign_pending_picker", @"")) {
                [[LeevaFacade instance] getCampaigns:PendingApproval delegate:self];
                
                NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
                [self comboBoxSetup:YES withTitle:title];
                
                [pickerView reloadComponent:0];
            }
            break;
            
        default:
            if ([_campaignComboBox titleLabel].text != NSLocalizedString(@"campaign_all_picker", @"")) {
                [[LeevaFacade instance] getCampaigns:All delegate:self];
                
                NSString *title = [self pickerView:pickerView titleForRow:row forComponent:component];
                [self comboBoxSetup:YES withTitle:title];
                
                [pickerView reloadComponent:0];
            }
            break;
    }
}

#pragma mark - UI Actions

- (void)comboBoxSelected
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (![_campaignPickerView isDescendantOfView:self.parentViewController.view])
        {
            _campaignPickerView.frame = CGRectMake(0, -_campaignPickerView.frame.size.height, _campaignPickerView.frame.size.width, _campaignPickerView.frame.size.height);
            [self.view addSubview:_campaignPickerView];
        }
        
        if (CGAffineTransformIsIdentity(_campaignPickerView.transform))
        {
            NSString *title = [self pickerView:_campaignPickerView titleForRow:[_campaignPickerView selectedRowInComponent:0] forComponent:0];
            [self comboBoxSetup:YES withTitle:title];
            
            [UIView beginAnimations:@"registerScroll" context:NULL];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationDuration:0.3];
            _campaignPickerView.transform = CGAffineTransformMakeTranslation(0,  _campaignPickerView.frame.size.height);
            [UIView commitAnimations];
        }
        else
        {
            NSString *title = [self pickerView:_campaignPickerView titleForRow:[_campaignPickerView selectedRowInComponent:0] forComponent:0];
            [self comboBoxSetup:NO withTitle:title];
            
            [UIView beginAnimations:@"registerScroll" context:NULL];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            [UIView setAnimationDuration:0.3];
            _campaignPickerView.transform = CGAffineTransformIdentity;
            [UIView commitAnimations];
        }
    }
    else
    {
        NSString *title = [self pickerView:_campaignPickerView titleForRow:[_campaignPickerView selectedRowInComponent:0] forComponent:0];
        [self comboBoxSetup:YES withTitle:title];
        
        _campaignPickerView.frame = CGRectMake(0, 0, _campaignTableViewController.tableView.frame.size.width, 162);
        
        UIViewController *view = [[UIViewController alloc] init];
        [view.view addSubview:_campaignPickerView];
        
        _campaignPopOverPickerView = [[UIPopoverController alloc] initWithContentViewController:view];
        _campaignPopOverPickerView.delegate = self;
        _campaignPopOverPickerView.popoverContentSize = CGSizeMake(_campaignPickerView.frame.size.width, _campaignPickerView.frame.size.height);
        [_campaignPopOverPickerView presentPopoverFromRect:CGRectMake(_campaignTableViewController.tableView.tableHeaderView.frame.size.width*0.85, _campaignTableViewController.tableView.tableHeaderView.frame.size.height+18, 0, 0) inView:self.parentViewController.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
}

#pragma mark - Pop over Delegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSString *title = [self pickerView:_campaignPickerView titleForRow:[_campaignPickerView selectedRowInComponent:0] forComponent:0];
    [self comboBoxSetup:NO withTitle:title];
    
    [_campaignPickerView removeFromSuperview];
    [_campaignPopOverPickerView dismissPopoverAnimated:YES];
    [_campaignPopOverPickerView.contentViewController.view removeFromSuperview];
    [_campaignPopOverPickerView.contentViewController.view release];
    [_campaignPopOverPickerView release];
    _campaignPopOverPickerView = nil;
}

#pragma mark - Leeva Delegate

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
                    
                    for (NSDictionary *campaign in campaigns)
                    {
                        Campaign *newCampaing = [[Campaign alloc] initCampaignWithJson:campaign];
                        [newItemsList addObject:newCampaing];
                        [newCampaing release];
                    }
                    
                    if (newItemsList)
                    {
                        [_itemsList release];
                        _itemsList = newItemsList;
                    }
                    
                    [_campaignTableViewController.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
                }
                else
                {
                    NSMutableArray *newItemsList = [[NSMutableArray alloc] init];
                    
                    if (newItemsList)
                    {
                        [_itemsList release];
                        _itemsList = newItemsList;
                    }
                    
                    [_campaignTableViewController.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
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
