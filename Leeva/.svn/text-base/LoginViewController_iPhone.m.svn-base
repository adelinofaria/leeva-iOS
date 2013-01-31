//
//  LoginViewController_iPhone.m
//  Leeva
//
//  Created by Adelino Faria on 7/25/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LoginViewController_iPhone.h"
#import "LoginRemindViewController_iPhone.h"
#import "LeevaColor.h"


@implementation LoginViewController_iPhone

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
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_login.png"]];
    view.autoresizesSubviews = YES;
    self.view = view;
    
    UIButton *regist = [UIButton buttonWithType:UIButtonTypeCustom];
    regist.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
    [regist setTitleColor:[UIColor leevaRegisterColor] forState:UIControlStateNormal];
    [regist setTitle:NSLocalizedString(@"login_register", @"") forState:UIControlStateNormal];
    [regist addTarget:self action:@selector(signup) forControlEvents:UIControlEventTouchUpInside];
    CGSize framesize = [regist.titleLabel.text sizeWithFont:regist.titleLabel.font];
    regist.frame = CGRectMake(160-(framesize.width*0.5), 20, framesize.width, 30);
    
    
    username = [[UITextField alloc] init];
    username.frame = CGRectMake(25, 295, 270, 30);
    username.tag = 1;
    username.delegate = self;
    username.returnKeyType = UIReturnKeyNext;
    username.enablesReturnKeyAutomatically = YES;
    username.textAlignment = UITextAlignmentCenter;
    username.autocorrectionType = UITextAutocorrectionTypeNo;
    username.autocapitalizationType = UITextAutocapitalizationTypeNone;
    username.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
    username.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    username.placeholder = NSLocalizedString(@"login_username_placeholder", @"");
    username.textColor = [UIColor leevaTextBoxColor];
    [username setValue:[UIColor leevaPlaceholderColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    password = [[UITextField alloc] init];
    password.frame = CGRectMake(25, 330, 270, 30);
    password.tag = 2;
    password.delegate = self;
    password.secureTextEntry = YES;
    password.returnKeyType = UIReturnKeyDone;
    password.enablesReturnKeyAutomatically = YES;
    password.textAlignment = UITextAlignmentCenter;
    password.autocorrectionType = UITextAutocorrectionTypeNo;
    password.autocapitalizationType = UITextAutocapitalizationTypeNone;
    password.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
    password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    password.placeholder = NSLocalizedString(@"login_password_placeholder", @"");
    password.textColor = [UIColor leevaTextBoxColor];
    [password setValue:[UIColor leevaPlaceholderColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    login = [UIButton buttonWithType:UIButtonTypeCustom];
    login.frame = CGRectMake(195, 365, 95, 25);
    login.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
    [login setTitleColor:[UIColor leevaPlaceholderColor] forState:UIControlStateNormal];
    [login setTitle:NSLocalizedString(@"login_enter", @"") forState:UIControlStateNormal];
    [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    login.tag = 3;
    
    UILabel *forgot = [[UILabel alloc] init];
    forgot.frame = CGRectMake(0, 425, 200, 35);
    forgot.textAlignment = UITextAlignmentRight;
    forgot.text = NSLocalizedString(@"login_forgot", @"");
    forgot.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    forgot.textColor = [UIColor leevaRemenberColor];
    forgot.backgroundColor = [UIColor clearColor];
    
    forgot.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    forgot.layer.shadowColor = [UIColor whiteColor].CGColor;
    forgot.layer.shadowRadius = 0.5f;
    forgot.layer.shadowOpacity = 0.8;
    
    UIButton *click = [UIButton buttonWithType:UIButtonTypeCustom];
    click.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0];
    click.titleLabel.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    click.titleLabel.layer.shadowColor = [UIColor whiteColor].CGColor;
    click.titleLabel.layer.shadowRadius = 0.5;
    click.titleLabel.layer.shadowOpacity = 0.8;
    [click setTitle:NSLocalizedString(@"login_click", @"") forState:UIControlStateNormal];
    [click setTitleColor:[UIColor leevaClickColor] forState:UIControlStateNormal];
    [click addTarget:self action:@selector(passwordRemind) forControlEvents:UIControlEventTouchUpInside];
    click.frame = CGRectMake(205, 425, [click.titleLabel.text sizeWithFont:click.titleLabel.font].width, 35);
    
    
    [self.view addSubview:regist];
    [self.view addSubview:username];
    [self.view addSubview:password];
    [self.view addSubview:login];
    [self.view addSubview:forgot];
    [self.view addSubview:click];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    [UIView beginAnimations:@"registerScroll" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.3];
    self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardSize.size.height);
    [UIView commitAnimations];
}
- (void)keyboardWillHide:(NSNotification *)notification {
    [UIView beginAnimations:@"registerScroll" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    self.view.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

- (void)passwordRemind {
    [super passwordRemind];
    
    LoginRemindViewController_iPhone *forgotPassword = [[LoginRemindViewController_iPhone alloc] initWithNibName:nil bundle:nil];
    
    forgotPassword.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:forgotPassword animated:YES];
    
    [forgotPassword release];
}

@end
