//
//  SubscriberAddViewController.m
//  Leeva
//
//  Created by Adelino Faria on 7/29/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SubscriberAddViewController.h"
#import "LeevaColor.h"


@implementation SubscriberAddViewController

@synthesize dataSource=_dataSource;
@synthesize addSubscriberButton=_addSubscriberButton;
@synthesize addSubscriberTextField=_addSubscriberTextField;
@synthesize addSubscriberTableViewController=_addSubscriberTableViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dataSource = [[NSMutableArray alloc] init];
        
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

- (void)setEmail:(NSString *)email {
    self.addSubscriberTextField.text = email;
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([emailTest evaluateWithObject:self.addSubscriberTextField.text]) {
        self.addSubscriberButton.enabled = YES;
        self.addSubscriberButton.backgroundColor = [UIColor leevaButtonColor];
        [self.addSubscriberButton setTitle:NSLocalizedString(@"subscriber_add_button", @"") forState:UIControlStateNormal];
    } else {
        self.addSubscriberButton.enabled = NO;
        self.addSubscriberButton.backgroundColor = [UIColor lightGrayColor];
        [self.addSubscriberButton setTitle:NSLocalizedString(@"subscriber_disabled_button", @"") forState:UIControlStateNormal];
    }
}

- (void)addSubscriber {
    BOOL selectedList = NO;
    
    for (NSDictionary *dicionary in _dataSource) {
        if ([[dicionary valueForKey:@"selected"] isEqualToString:@"yes"]) {
            selectedList = YES;
            //TODO enviar add subscriber
        }
    }
    
    if (!selectedList) {
        [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"subscriber_title", @"")  message:NSLocalizedString(@"subscriber_title", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"subscriber_title", @"") otherButtonTitles: nil] autorelease] show];
    }
}

- (void)addSubscriberCancel {
    [self dismissModalViewControllerAnimated:YES];
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
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
        cell.textLabel.textColor = [UIColor leevaValueColor1];
    }
    
    cell.textLabel.text = [[_dataSource objectAtIndex:indexPath.row] valueForKey:@"Name"];
    
    if ([[[_dataSource objectAtIndex:indexPath.row] valueForKey:@"selected"] isEqualToString:@"yes"]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[[_dataSource objectAtIndex:indexPath.row] valueForKey:@"selected"] isEqualToString:@"yes"]) {
        [self tableView:self.addSubscriberTableViewController.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        [[self.dataSource objectAtIndex:indexPath.row] setValue:@"no" forKey:@"selected"];
    } else {
        [self tableView:self.addSubscriberTableViewController.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [[self.dataSource objectAtIndex:indexPath.row] setValue:@"yes" forKey:@"selected"];
    }
    
    [_addSubscriberTableViewController.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

#pragma mark - UITextFieldDelegate - Editing the Text Field’s Text

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([emailTest evaluateWithObject:textField.text]) {
        _addSubscriberButton.enabled = YES;
        _addSubscriberButton.backgroundColor = [UIColor leevaButtonColor];
        [_addSubscriberButton setTitle:NSLocalizedString(@"subscriber_add_button", @"") forState:UIControlStateNormal];
    } else {
        _addSubscriberButton.enabled = NO;
        _addSubscriberButton.backgroundColor = [UIColor lightGrayColor];
        [_addSubscriberButton setTitle:NSLocalizedString(@"subscriber_disabled_button", @"") forState:UIControlStateNormal];
    }
    return YES;
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
                    NSMutableArray *lists = [[NSMutableArray alloc] init];
                    
                    for (NSDictionary *list in [result objectForKey:@"Lists"]) {
                        [list setValue:@"no" forKey:@"selected"];
                        [lists addObject:list];
                    }
                    self.dataSource = lists;
                }
                else
                {
                    if ([self.dataSource count] > 0) {
                        NSMutableArray *listIDs = [[NSMutableArray alloc] init];
                        
                        self.dataSource = listIDs;
                        
                        [listIDs release];
                    }
                }
                
                [_addSubscriberTableViewController.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
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
