//
//  LoginRemindViewController_iPhone.m
//  Leeva
//
//  Created by Adelino Faria on 7/25/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LoginRemindViewController_iPhone.h"
#import "LeevaColor.h"


@implementation LoginRemindViewController_iPhone

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
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.tintColor = [UIColor leevaBarBackgroundColor];
    toolbar.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    toolbar.layer.shadowOpacity = 0.5;
    toolbar.layer.shadowRadius = 0.5;
    toolbar.layer.shouldRasterize = YES;
    toolbar.tag = 1;
    
    UILabel *toolbarTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbarTitle.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.f];
    toolbarTitle.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
    toolbarTitle.backgroundColor = [UIColor clearColor];
    toolbarTitle.textAlignment = UITextAlignmentCenter;
    toolbarTitle.textColor = [UIColor leevaValueColor3];
    toolbarTitle.layer.shadowColor = [UIColor whiteColor].CGColor;
    toolbarTitle.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    toolbarTitle.layer.shadowOpacity = 0.5;
    toolbarTitle.layer.shadowRadius = 0.5;
    toolbarTitle.layer.shouldRasterize = YES;
    toolbarTitle.text = NSLocalizedString(@"login_remember", @"");
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.f];
    cancelButton.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    cancelButton.titleLabel.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    cancelButton.titleLabel.layer.shadowOpacity = 1;
    cancelButton.titleLabel.layer.shadowRadius = 0.5;
    [cancelButton setTitle:NSLocalizedString(@"cancel", @"") forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(remenberCancel) forControlEvents:UIControlEventTouchUpInside];
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
    
    UILabel *remenberText = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 240, 60)];
    remenberText.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
    remenberText.text = NSLocalizedString(@"login_insert_email", @"");
    remenberText.textAlignment = UITextAlignmentCenter;
    remenberText.textColor = [UIColor leevaTextBoxColor];
    remenberText.backgroundColor = [UIColor clearColor];
    remenberText.numberOfLines = 2;
    remenberText.tag = 2;
    
    UITextField *emailField = [[UITextField alloc] init];
    emailField.frame = CGRectMake(45, 320, 230, 30);
    emailField.returnKeyType = UIReturnKeyDone;
    emailField.enablesReturnKeyAutomatically = YES;
    emailField.textAlignment = UITextAlignmentCenter;
    emailField.keyboardType = UIKeyboardTypeEmailAddress;
    emailField.autocorrectionType = UITextAutocorrectionTypeNo;
    emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    emailField.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
    emailField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    emailField.placeholder = NSLocalizedString(@"login_email", @"");
    emailField.textColor = [UIColor leevaTextBoxColor];
    [emailField addTarget:self action:@selector(passwordRemindRequest) forControlEvents:UIControlEventEditingDidEndOnExit];
    [emailField setValue:[UIColor leevaPlaceholderColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    emailField.layer.backgroundColor = [UIColor leevaElementBackgroundColor].CGColor;
    emailField.layer.cornerRadius = 5.0f;
    emailField.layer.borderWidth = 1.0;
    emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    emailField.layer.shadowColor = [UIColor whiteColor].CGColor;
    emailField.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    emailField.layer.shadowOpacity = 0.8;
    emailField.layer.shadowRadius = 0.5;
    emailField.layer.masksToBounds = NO;
    emailField.tag = 3;
    
    UIButton *remenberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    remenberButton.layer.cornerRadius = 5.0f;
    remenberButton.layer.masksToBounds = NO;
    remenberButton.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    remenberButton.layer.shadowRadius = 0.5;
    remenberButton.layer.shadowOpacity = 0.8;
    remenberButton.titleLabel.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    remenberButton.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    remenberButton.titleLabel.layer.shadowRadius = 0.5;
    remenberButton.titleLabel.layer.shadowOpacity = 1.0;
    remenberButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16.0];
    [remenberButton setTitle:NSLocalizedString(@"login_ok", @"") forState:UIControlStateNormal];
    [remenberButton addTarget:self action:@selector(passwordRemindRequest) forControlEvents:UIControlEventTouchUpInside];
    remenberButton.backgroundColor = [UIColor leevaButtonColor];
    [remenberButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGSize size = [remenberButton.titleLabel.text sizeWithFont:remenberButton.titleLabel.font];
    remenberButton.frame = CGRectMake(275-size.width-10, 360, size.width+10, 25);
    
    [toolbar addSubview:toolbarTitle];
    
    [view addSubview:remenberText];
    [view addSubview:emailField];
    [view addSubview:remenberButton];
    [view addSubview:toolbar];
    
    [toolbar release];
    [toolbarTitle release];
    [cancelBarButton release];
    [remenberText release];
    [emailField release];
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
    /* register for keyboard notifications */
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowRememberPassword:) name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideRememberPassword:) name:UIKeyboardWillHideNotification object:self.view.window];
}

- (void)viewWillDisappear:(BOOL)animated
{
    /* unregister for keyboard notifications while not visible */
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)keyboardWillShowRememberPassword:(NSNotification *)notification {
    CGRect keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    [UIView beginAnimations:@"registerScroll" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.3];
    self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardSize.size.height*0.7);
    [self.view viewWithTag:1].transform = CGAffineTransformMakeTranslation(0, keyboardSize.size.height*0.7);
    [self.view viewWithTag:2].transform = CGAffineTransformMakeTranslation(0, -keyboardSize.size.height*0.7);
    [UIView commitAnimations];
}
- (void)keyboardWillHideRememberPassword:(NSNotification *)notification {
    [UIView beginAnimations:@"registerScroll" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    self.view.transform = CGAffineTransformIdentity;
    [self.view viewWithTag:1].transform = CGAffineTransformIdentity;
    [self.view viewWithTag:2].transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

@end
