//
//  LeevaFacade.m
//  Leeva
//
//  Created by Adelino Faria on 3/21/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <SystemConfiguration/SystemConfiguration.h>
#import "LeevaFacade.h"
#import "LoginViewController.h"
#import "LeevaAppDelegate.h"


@implementation LeevaFacade

static LeevaFacade *_instance = nil;

@synthesize person;
@synthesize campaigns;
@synthesize lists;

+ (LeevaFacade *)instance
{
    if (!_instance)
    {
        _instance = [[LeevaFacade alloc] init];
    }
    return _instance;
}

- (NSString *)getSessionID
{
    if (self.person)
        return self.person.sessionID;
    else
        return @"";
}

- (void)loginWithExistingCredentials:(UIViewController *)callerView {
    
    if (!person) {
        NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
        NSString *sessionID = [[NSUserDefaults standardUserDefaults] objectForKey:@"sessionID"];
        NSString *role = [[NSUserDefaults standardUserDefaults] objectForKey:@"role"];
        
        if (username && password && sessionID && role)
        {
            if ([role isEqualToString:@"admin"]) {
                person = [[Admin alloc] init];
            } else
                if ([role isEqualToString:@"user"]) {
                    person = [[User alloc] init];
                } else
                    if ([role isEqualToString:@"client"]) {
                        person = [[Client alloc] init];
                    } else {
                        person = [[Person alloc] init];
                    }
            
            person.username = username;
            person.password = password;
            person.sessionID = sessionID;
            
            SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, "app.espserv.com");
            SCNetworkReachabilityFlags flags;
            BOOL success = SCNetworkReachabilityGetFlags(reachability, &flags) && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
            CFRelease(reachability);
            
            if (success)
                [LeevaFacade loginAdmin:username password:password delegate:self];
        }
        else
        {
            [LoginViewController presentLoginView:callerView];
        }
    } else {
        NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
        
        if (username && password) {
            [LeevaFacade loginAdmin:username password:password delegate:self];
        }
        else {
            [LoginViewController presentLoginView:callerView];
        }
    }
}

+ (void)loginClient:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate
{
    [Person loginClient:username password:password delegate:delegate];
}

+ (void)loginUser:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate
{
    [Person loginUser:username password:password delegate:delegate];
}

+ (void)loginAdmin:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate
{
    [Person loginAdmin:username password:password delegate:delegate];
}

+ (void)passwordRemindUser:(NSString *)email delegate:(id<LeevaDelegate>)delegate {
    [Person passwordRemindUser:email delegate:delegate];
}

+ (void)passwordRemindClient:(NSString *)email delegate:(id<LeevaDelegate>)delegate {
    [Person passwordRemindClient:email delegate:delegate];
}

- (void)getUser:(NSString *)userID delegate:(id<LeevaDelegate>)delegate
{
    [User getUser:userID sessionID:[self getSessionID] delegate:delegate];
}

- (void)getClients:orderField orderType:(NSString *)orderType delegate:(id<LeevaDelegate>)delegate
{
    [Client getClients:[self getSessionID] orderField:orderField orderType:orderType delegate:delegate];
}

- (void)searchSubscribers:(NSString *)searchToken listID:(NSString *)list recordsFrom:(NSString *)recordsFrom recordsPerRequest:(NSString *)recordsPerRequest delegate:(id<LeevaDelegate>)delegate {
    [Subscriber searchSubscribers:searchToken listID:list recordsFrom:recordsFrom recordsPerRequest:recordsPerRequest sessionID:[self getSessionID] delegate:delegate];
}

- (void)getSubscribersLists:(id<LeevaDelegate>)delegate
{
    [Subscriber getSubscriberLists:[self getSessionID] delegate:delegate];
}

- (void)getSubscribers:(NSString *)list recordsFrom:(NSString *)recordsFrom recordsPerRequest:(NSString *)recordsPerRequest delegate:(id<LeevaDelegate>)delegate
{
    [Subscriber getSubscribers:list recordsFrom:recordsFrom recordsPerRequest:recordsPerRequest sessionID:[self getSessionID] delegate:delegate];
}
- (void)getSubscriber:(NSString *)emailAddress fromList:(NSString *)list delegate:(id<LeevaDelegate>)delegate
{
    [Subscriber getSubscriber:emailAddress fromList:list sessionID:[self getSessionID] delegate:delegate];
}

- (void)getCampaigns:(CampaignStatus)type delegate:(id<LeevaDelegate>)delegate
{
    [Campaign getCampaigns:type sessionID:[self getSessionID] delegate:delegate];
}

- (void)getCampaign:(NSString *)campaignID retrieveStatistics:(BOOL)retrieveStatistics delegate:(id<LeevaDelegate>)delegate
{
    [Campaign getCampaign:campaignID retrieveStatistics:retrieveStatistics sessionID:[self getSessionID] delegate:delegate];
}

- (void)getLists:(id<LeevaDelegate>)delegate
{
    [List getLists:[self getSessionID] delegate:delegate];
}

- (void)getList:(NSString *)listID delegate:(id<LeevaDelegate>)delegate
{
    [List getList:listID sessionID:[self getSessionID] delegate:delegate];
}

- (void)getEmails:(id<LeevaDelegate>)delegate
{
    [Email getEmails:[self getSessionID] delegate:delegate];
}

- (void)getEmail:(NSString *)emailID delegate:(id<LeevaDelegate>)delegate
{
    [Email getEmail:emailID sessionID:[self getSessionID] delegate:delegate];
}

- (void)getUserGroup:(NSString *)userGroupID delegate:(id<LeevaDelegate>)delegate
{
    [UserGroup getUserGroup:userGroupID sessionID:[self getSessionID] delegate:delegate];
}

- (void)getThemes:(id<LeevaDelegate>)delegate
{
    [Theme getThemes:[self getSessionID] delegate:delegate];
}

- (void)getTheme:(NSString *)themeID delegate:(id<LeevaDelegate>)delegate
{
    [Theme getTheme:themeID sessionID:[self getSessionID] delegate:delegate];
}

+ (void)requestReturn:(id<LeevaDelegate>)delegate result:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary
{
    if(delegate)
        [delegate leevaResult:result fromRequest:dictionary];
}

- (void)dealloc
{
    [_instance release];
    [super dealloc];
}

- (void)leevaResult:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary {
    if (result != nil && [result valueForKey:@"Success"] != nil)
    {
        NSString *command = [dictionary valueForKey:@"Command"];
        
        if ([[result valueForKey:@"Success"] boolValue])
        {
            if (command == @"Admin.Login")
            {
                Admin *admin = [[Admin alloc] initAdminWithJson:[result valueForKey:@"AdminInfo"]];
                admin.sessionID = [result valueForKey:@"SessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:admin.sessionID forKey:@"sessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:@"admin" forKey:@"role"];
                self.person = admin;
                [admin release];
            }
            if (command == @"User.Login")
            {
                User *user = [[User alloc] initUserWithJson:[result valueForKey:@"UserInfo"]];
                user.sessionID = [result valueForKey:@"SessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:user.sessionID forKey:@"sessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:@"user" forKey:@"role"];
                self.person = user;
                [user release];
            }
            if (command == @"Client.Login")
            {
                Client *client = [[Client alloc] initClientWithJson:[result valueForKey:@"ClientInfo"]];
                client.sessionID = [result valueForKey:@"SessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:client.sessionID forKey:@"sessionID"];
                [[NSUserDefaults standardUserDefaults] setObject:@"client" forKey:@"role"];
                self.person = client;
                [client release];
            }
        }
        else
        {
            if (command == @"Admin.Login")
                [LeevaFacade loginUser:[[NSUserDefaults standardUserDefaults] objectForKey:@"username"] password:[[NSUserDefaults standardUserDefaults] objectForKey:@"password"] delegate:self];
            if (command == @"User.Login")
                [LeevaFacade loginClient:[[NSUserDefaults standardUserDefaults] objectForKey:@"username"] password:[[NSUserDefaults standardUserDefaults] objectForKey:@"password"] delegate:self];
            if (command == @"Client.Login")
            {
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"password"];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sessionID"];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"role"];
                
                [LoginViewController presentLoginView:[LeevaAppDelegate instance].rootTabBarController];
            }
            
        }
    }
    else
    {
        [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"error_no_connection_title", @"") message:NSLocalizedString(@"error_no_connection", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
    }
}

@end
