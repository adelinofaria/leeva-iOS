//
//  LoginViewController.m
//  Leeva
//
//  Created by Adelino Faria on 4/11/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"
#import "LoginViewController_iPhone.h"
#import "LoginViewController_iPad.h"
#import "LeevaColor.h"


@implementation LoginViewController

static LoginViewController *instance;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        instance = self;
    }
    return self;
}

- (void)dealloc
{
    instance = nil;
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:self.view.window];
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
    return YES;
}

+ (void)presentLoginView:(UIViewController *)onView {
    if (!instance) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            LoginViewController_iPhone *loginView = [[LoginViewController_iPhone alloc] initWithNibName:nil bundle:nil];
            loginView.modalPresentationStyle = UIModalPresentationFormSheet;
            [onView presentModalViewController:loginView animated:YES];
            [loginView release];
        } else {
            LoginViewController_iPad *loginView = [[LoginViewController_iPad alloc] initWithNibName:nil bundle:nil];
            loginView.modalPresentationStyle = UIModalPresentationFormSheet;
            [onView presentModalViewController:loginView animated:YES];
            [loginView release];
        }
    } else {
        // MOSTRAR VIEW REMOVER ANTIGA OU METER ANTIGA Á FRENTE
    }
}

- (void)login {
    if ([username isFirstResponder])
    {
        [username resignFirstResponder];
    }
    else
    {
        if ([password isFirstResponder])
        {
            [password resignFirstResponder];
        }
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:username.text forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:password.text forKey:@"password"];
    
    [LeevaFacade loginAdmin:username.text password:password.text delegate:self];
}

- (void)signup {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [[LeevaRequest baseUrl] stringByReplacingOccurrencesOfString:@"api" withString:@"signup"]]];
}

- (void)passwordRemind {
    if ([username isFirstResponder])
    {
        [username resignFirstResponder];
    }
    else
    {
        if ([password isFirstResponder])
        {
            [password resignFirstResponder];
        }
    }
}

- (BOOL)disablesAutomaticKeyboardDismissal {
    /*
     Return Value
     YES to prevent the dismissal of the input view or NO if the input view may be dismissed.
     
     Discussion
     Use this method to allow or disallow the dismissal of the current input view (usually the system keyboard) when changing from a control that wants the input view to one that does not. Under normal circumstances, when the user taps a control that requires an input view, the system automatically displays that view. Tapping in a control that does not want an input view subsequently causes the current input view to be dismissed but may not in all cases. You can override this method in those outstanding cases to allow the input view to be dismissed or use this method to prevent the view from being dismissed in other cases.
     
     The default implementation of this method returns YES when the modal presentation style of the view controller is set to UIModalPresentationFormSheet and returns NO for other presentation styles. Thus, the system normally does not allow the keyboard to be dismissed for modal forms.
     */
    return NO;
}

#pragma mark - UITextFieldDelegate - Editing the Text Field’s Text

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger nextTag = textField.tag + 1;
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder)
    {
        if (![nextResponder becomeFirstResponder])
        {
            [nextResponder resignFirstResponder];
            [instance login];
            return YES;
        }
    }
    else
    {
        [textField resignFirstResponder];
    }
    return NO;
}

#pragma mark - Leeva Delegate

- (void)leevaResult:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary
{
    if (result != nil && [result valueForKey:@"Success"] != nil)
    {
        NSString *command = [dictionary valueForKey:@"Command"];
        
        if ([[result valueForKey:@"Success"] boolValue])
        {
            LeevaFacade *lfacade = [LeevaFacade instance];
            
            if (command == @"Admin.Login")
            {
                Admin *admin = [[Admin alloc] initAdminWithJson:[result valueForKey:@"AdminInfo"]];
                [admin setSessionID:[result valueForKey:@"SessionID"]];
                [[NSUserDefaults standardUserDefaults] setObject:admin.sessionID forKey:@"sessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:@"admin" forKey:@"role"];
                lfacade.person = admin;
                [admin release];
                
                [self dismissModalViewControllerAnimated:YES];
            }
            if (command == @"User.Login")
            {
                LeevaFacade *lfacade = [LeevaFacade instance];
                User *user = [[User alloc] initUserWithJson:[result valueForKey:@"UserInfo"]];
                user.sessionID = [result valueForKey:@"SessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:user.sessionID forKey:@"sessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:@"user" forKey:@"role"];
                lfacade.person = user;
                [user release];
                
                [self dismissModalViewControllerAnimated:YES];
            }
            if (command == @"Client.Login")
            {
                Client *client = [[Client alloc] initClientWithJson:[result valueForKey:@"ClientInfo"]];
                [client setSessionID:[result valueForKey:@"SessionID"]];
                [[NSUserDefaults standardUserDefaults] setObject:client.sessionID forKey:@"sessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:@"client" forKey:@"role"];
                lfacade.person = client;
                [client release];
                
                [self dismissModalViewControllerAnimated:YES];
            }
        }
        else
        {
            if (command == @"Admin.Login")
                [LeevaFacade loginUser:[[NSUserDefaults standardUserDefaults] objectForKey:@"username"] password:[[NSUserDefaults standardUserDefaults] objectForKey:@"password"] delegate:self];
            if (command == @"User.Login")
                [LeevaFacade loginClient:[[NSUserDefaults standardUserDefaults] objectForKey:@"username"] password:[[NSUserDefaults standardUserDefaults] objectForKey:@"password"] delegate:self];
            if (command == @"Client.Login")
                [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"error_login_title", @"") message:NSLocalizedString(@"error_login", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"try_again", @"") otherButtonTitles:nil] autorelease] show];
            if (command == @"User.PasswordRemind")
                [LeevaFacade passwordRemindClient:((UITextField *)[self.modalViewController.view viewWithTag:3]).text delegate:self];
        }
    }
    else
    {
        [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"error_no_connection_title", @"") message:NSLocalizedString(@"error_no_connection", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
    }
}

@end
