//
//  SubscriberAddViewController_iPhone.m
//  Leeva
//
//  Created by Adelino Faria on 7/29/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SubscriberAddViewController_iPhone.h"
#import "LeevaColor.h"


@implementation SubscriberAddViewController_iPhone

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
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    view.autoresizesSubviews = YES;
    self.view = view;
    
    self.title = NSLocalizedString(@"subscriber_add", @"");
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.tintColor = [UIColor leevaBarBackgroundColor];
    toolbar.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    toolbar.layer.shadowOpacity = 0.5;
    toolbar.layer.shadowRadius = 0.5;
    toolbar.layer.shouldRasterize = YES;
    
    UILabel *toolbarTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbarTitle.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.f];
    toolbarTitle.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
    toolbarTitle.backgroundColor = [UIColor clearColor];
    toolbarTitle.textAlignment = UITextAlignmentCenter;
    toolbarTitle.textColor = [UIColor leevaValueColor3];
    toolbarTitle.layer.shadowColor = [UIColor whiteColor].CGColor;
    toolbarTitle.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    toolbarTitle.layer.shadowOpacity = 0.5;
    toolbarTitle.layer.shadowRadius = 0.5;
    toolbarTitle.layer.shouldRasterize = YES;
    toolbarTitle.text = self.title;
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.f];
    cancelButton.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    cancelButton.titleLabel.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    cancelButton.titleLabel.layer.shadowOpacity = 1;
    cancelButton.titleLabel.layer.shadowRadius = 0.5;
    [cancelButton setTitle:NSLocalizedString(@"cancel", @"") forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(addSubscriberCancel) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.frame = CGRectMake(0, 0, [cancelButton.titleLabel.text sizeWithFont:cancelButton.titleLabel.font].width+20, 30);
    cancelButton.layer.backgroundColor = [UIColor leevaButtonColor].CGColor;
    cancelButton.layer.cornerRadius = 5.0f;
    cancelButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    cancelButton.layer.borderWidth = 0.8;
    cancelButton.layer.shadowColor = [UIColor whiteColor].CGColor;
    cancelButton.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    cancelButton.layer.shadowOpacity = 0.5;
    cancelButton.layer.shadowRadius = 0.5;
    
    UIBarButtonItem *cancelBarButton = [[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    toolbar.items = [NSArray arrayWithObjects:cancelBarButton, nil];
    
    UILabel *emailAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 54, 260, 20)];
    emailAddressLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
    emailAddressLabel.text = NSLocalizedString(@"subscriber_email", @"");
    emailAddressLabel.textAlignment = UITextAlignmentLeft;
    emailAddressLabel.textColor = [UIColor leevaTextBoxColor];
    emailAddressLabel.backgroundColor = [UIColor clearColor];
    
    UITextField *emailField = [[UITextField alloc] init];
    emailField.frame = CGRectMake(20, 79, 280, 35);
    emailField.returnKeyType = UIReturnKeyDone;
    emailField.enablesReturnKeyAutomatically = YES;
    emailField.textAlignment = UITextAlignmentCenter;
    emailField.keyboardType = UIKeyboardTypeEmailAddress;
    emailField.autocorrectionType = UITextAutocorrectionTypeNo;
    emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    emailField.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
    emailField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    emailField.placeholder = NSLocalizedString(@"login_email", @"");
    emailField.textColor = [UIColor leevaTextBoxColor];
    [emailField setValue:[UIColor leevaPlaceholderColor] forKeyPath:@"_placeholderLabel.textColor"];
    self.addSubscriberTextField = emailField;
    
    emailField.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    emailField.layer.cornerRadius = 5.0f;
    emailField.layer.borderWidth = 1.0;
    emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    emailField.layer.shadowColor = [UIColor whiteColor].CGColor;
    emailField.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    emailField.layer.shadowOpacity = 0.8;
    emailField.layer.shadowRadius = 0.5;
    emailField.layer.masksToBounds = NO;
    emailField.delegate = self;
    
    UILabel *subscriberListsLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 124, 260, 20)];
    subscriberListsLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
    subscriberListsLabel.text = NSLocalizedString(@"subscriber_list", @"");
    subscriberListsLabel.textAlignment = UITextAlignmentLeft;
    subscriberListsLabel.textColor = [UIColor leevaTextBoxColor];
    subscriberListsLabel.backgroundColor = [UIColor clearColor];
    
    UITableViewController *tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewController.tableView.frame = CGRectMake(20, 149, 280, 256);
    tableViewController.tableView.backgroundColor = [UIColor leevaElementBackgroundColor];
    tableViewController.tableView.separatorColor = [UIColor leevaBarBackgroundColor];
    tableViewController.tableView.layer.borderColor = [UIColor leevaBarBackgroundColor].CGColor;
    tableViewController.tableView.layer.borderWidth = 1.0;
    tableViewController.tableView.dataSource = self;
    tableViewController.tableView.delegate = self;
    self.addSubscriberTableViewController = tableViewController;
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(20, 405, 280, 35);
    addButton.layer.cornerRadius = 5.0f;
    addButton.layer.masksToBounds = NO;
    addButton.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    addButton.layer.shadowRadius = 0.5;
    addButton.layer.shadowOpacity = 0.8;
    addButton.titleLabel.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    addButton.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    addButton.titleLabel.layer.shadowRadius = 0.5;
    addButton.titleLabel.layer.shadowOpacity = 1.0;
    addButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16.0];
    addButton.enabled = NO;
    addButton.backgroundColor = [UIColor lightGrayColor];
    [addButton setTitle:NSLocalizedString(@"subscriber_disabled_button", @"") forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addSubscriber) forControlEvents:UIControlEventTouchUpInside];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.addSubscriberButton = addButton;
    
    [toolbar addSubview:toolbarTitle];
    
    [view addSubview:emailAddressLabel];
    [view addSubview:subscriberListsLabel];
    [view addSubview:emailField];
    [view addSubview:tableViewController.tableView];
    [view addSubview:addButton];
    [view addSubview:toolbar];
    
    [toolbar release];
    [toolbarTitle release];
    [cancelBarButton release];
    [emailAddressLabel release];
    [subscriberListsLabel release];
    [emailField release];
}

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

@end
