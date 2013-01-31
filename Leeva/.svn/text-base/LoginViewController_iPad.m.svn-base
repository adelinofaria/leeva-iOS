//
//  LoginViewController_iPad.m
//  Leeva
//
//  Created by Adelino Faria on 7/25/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LoginViewController_iPad.h"
#import "LoginRemindViewController_iPad.h"
#import "LeevaColor.h"


@implementation LoginViewController_iPad

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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 540, 620)];
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_login_ipad.png"]];
    view.autoresizesSubviews = YES;
    self.view = view;
    
    UIButton *regist = [UIButton buttonWithType:UIButtonTypeCustom];
    regist.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:24.0];
    [regist setTitleColor:[UIColor leevaRegisterColor] forState:UIControlStateNormal];
    [regist setTitle:NSLocalizedString(@"login_register", @"") forState:UIControlStateNormal];
    [regist addTarget:self action:@selector(signup) forControlEvents:UIControlEventTouchUpInside];
    CGSize framesize = [regist.titleLabel.text sizeWithFont:regist.titleLabel.font];
    regist.frame = CGRectMake(270-(framesize.width*0.5), 40, framesize.width, 40);
    
    
    username = [[UITextField alloc] init];
    username.frame = CGRectMake(70, 400, 400, 40);
    username.tag = 1;
    username.delegate = self;
    username.returnKeyType = UIReturnKeyNext;
    username.enablesReturnKeyAutomatically = YES;
    username.textAlignment = UITextAlignmentCenter;
    username.autocorrectionType = UITextAutocorrectionTypeNo;
    username.autocapitalizationType = UITextAutocapitalizationTypeNone;
    username.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24.0];
    username.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    username.placeholder = NSLocalizedString(@"login_username_placeholder", @"");
    username.textColor = [UIColor leevaTextBoxColor];
    [username setValue:[UIColor leevaPlaceholderColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    password = [[UITextField alloc] init];
    password.frame = CGRectMake(70, 450, 400, 40);
    password.tag = 2;
    password.delegate = self;
    password.secureTextEntry = YES;
    password.returnKeyType = UIReturnKeyDone;
    password.enablesReturnKeyAutomatically = YES;
    password.textAlignment = UITextAlignmentCenter;
    password.autocorrectionType = UITextAutocorrectionTypeNo;
    password.autocapitalizationType = UITextAutocapitalizationTypeNone;
    password.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:24.0];
    username.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    password.placeholder = NSLocalizedString(@"login_password_placeholder", @"");
    password.textColor = [UIColor leevaTextBoxColor];
    [password setValue:[UIColor leevaPlaceholderColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    login = [UIButton buttonWithType:UIButtonTypeCustom];
    login.frame = CGRectMake(325, 505, 125, 30);
    login.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:24.0];
    [login setTitleColor:[UIColor leevaPlaceholderColor] forState:UIControlStateNormal];
    [login setTitle:NSLocalizedString(@"login_enter", @"") forState:UIControlStateNormal];
    [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    login.tag = 3;
    
    UILabel *forgot = [[UILabel alloc] init];
    forgot.frame = CGRectMake(0, 560, 340, 60);
    forgot.textAlignment = UITextAlignmentRight;
    forgot.text = NSLocalizedString(@"login_forgot", @"");
    forgot.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
    forgot.textColor = [UIColor leevaRemenberColor];
    forgot.backgroundColor = [UIColor clearColor];
    
    forgot.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    forgot.layer.shadowColor = [UIColor whiteColor].CGColor;
    forgot.layer.shadowRadius = 0.5f;
    forgot.layer.shadowOpacity = 0.8;
    
    UIButton *click = [UIButton buttonWithType:UIButtonTypeCustom];
    click.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17.0];
    click.titleLabel.layer.shadowOffset = CGSizeMake(0.0f, 0.5f);
    click.titleLabel.layer.shadowColor = [UIColor whiteColor].CGColor;
    click.titleLabel.layer.shadowRadius = 0.5;
    click.titleLabel.layer.shadowOpacity = 0.8;
    [click setTitle:NSLocalizedString(@"login_click", @"") forState:UIControlStateNormal];
    [click setTitleColor:[UIColor leevaClickColor] forState:UIControlStateNormal];
    [click addTarget:self action:@selector(passwordRemind) forControlEvents:UIControlEventTouchUpInside];
    click.frame = CGRectMake(345, 560, [click.titleLabel.text sizeWithFont:click.titleLabel.font].width, 60);
    
    
    [self.view addSubview:regist];
    [self.view addSubview:username];
    [self.view addSubview:password];
    [self.view addSubview:login];
    [self.view addSubview:forgot];
    [self.view addSubview:click];
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
	return YES;
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect rect = self.view.superview.frame;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{
        if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {
            self.view.superview.transform = CGAffineTransformTranslate(self.view.superview.transform, 0, -(rect.origin.y + rect.size.height + keyboardSize.size.height - [[UIScreen mainScreen] bounds].size.height));
        } else
            if (self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
                self.view.superview.transform = CGAffineTransformTranslate(self.view.superview.transform, 0, -([[UIScreen mainScreen] bounds].size.height-(rect.origin.y+rect.size.height) + rect.size.height + keyboardSize.size.height - [[UIScreen mainScreen] bounds].size.height));
            } else
                if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
                    self.view.superview.transform = CGAffineTransformTranslate(self.view.superview.transform, 0, -(rect.origin.x + rect.size.width + keyboardSize.size.width - [[UIScreen mainScreen] bounds].size.width));
                } else
                    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
                        self.view.superview.transform = CGAffineTransformTranslate(self.view.superview.transform, 0, -([[UIScreen mainScreen] bounds].size.width-(rect.origin.x+rect.size.width) + rect.size.width + keyboardSize.size.width - [[UIScreen mainScreen] bounds].size.width));
                    }
    } completion:nil];
}
- (void)keyboardWillHide:(NSNotification *)notification {
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseIn) animations:^{
        if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {
            self.view.superview.transform = CGAffineTransformTranslate(self.view.superview.transform, -self.view.superview.transform.tx, -self.view.superview.transform.ty);
        } else
            if (self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
                self.view.superview.transform = CGAffineTransformTranslate(self.view.superview.transform, self.view.superview.transform.tx, self.view.superview.transform.ty);
            } else
                if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
                    self.view.superview.transform = CGAffineTransformTranslate(self.view.superview.transform, self.view.superview.transform.ty, -self.view.superview.transform.tx);
                } else
                    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
                        self.view.superview.transform = CGAffineTransformTranslate(self.view.superview.transform, -self.view.superview.transform.ty, self.view.superview.transform.tx);
                    }
    } completion:nil];
}

- (void)passwordRemind {
    [super passwordRemind];
    
    LoginRemindViewController_iPad *forgotPassword = [[LoginRemindViewController_iPad alloc] initWithNibName:nil bundle:nil];
    
    forgotPassword.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    forgotPassword.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:forgotPassword animated:YES];
    [forgotPassword release];
}

@end
