//
//  LoginRemindViewController.m
//  Leeva
//
//  Created by Adelino Faria on 7/25/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "LoginRemindViewController.h"


@implementation LoginRemindViewController

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

- (void)passwordRemindRequest {
    UITextField *textField = ((UITextField *)[self.modalViewController.view viewWithTag:3]);
    if ([textField isFirstResponder])
        [textField resignFirstResponder];
    
    [LeevaFacade passwordRemindUser:textField.text delegate:self];
}

- (void)remenberCancel {
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
    [alertView release];
    
    [self remenberCancel];
}

#pragma mark - Leeva Delegate

- (void)leevaResult:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary
{
    if (result != nil && [result valueForKey:@"Success"] != nil)
    {
        NSString *command = [dictionary valueForKey:@"Command"];
        
        if ([[result valueForKey:@"Success"] boolValue])
        {
            if (command == @"User.PasswordRemind" || command == @"Client.PasswordRemind") {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"login_password_recovery", @"") message:NSLocalizedString(@"login_email_sent", @"") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil];
                [alert show];
            }
        }
        else
        {
            if (command == @"Client.PasswordRemind")
                [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"error_email_title", @"") message:NSLocalizedString(@"error_email", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"try_again", @"") otherButtonTitles:nil] autorelease] show];
        }
    }
    else
    {
        [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"error_no_connection_title", @"") message:NSLocalizedString(@"error_no_connection", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
    }
}

@end
