//
//  User.m
//  Leeva
//
//  Created by Adelino Faria on 3/21/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "User.h"
#import "LeevaRequest.h"


@implementation User

@synthesize relUserGroupID;
@synthesize reputationLevel;
@synthesize userSince;
@synthesize firstName;
@synthesize lastName;
@synthesize companyName;
@synthesize website;
@synthesize street;
@synthesize city;
@synthesize state;
@synthesize zip;
@synthesize country;
@synthesize phone;
@synthesize fax;
@synthesize timeZone;
@synthesize signUpIPAddress;
@synthesize APIKey;
@synthesize language;
@synthesize lastActivityDateTime;
@synthesize previewMyEmailAccount;
@synthesize previewMyEmailAPIKey;
@synthesize forwardToFriendHeader;
@synthesize forwardToFriendFooter;
@synthesize accountStatus;
@synthesize availableCredits;
@synthesize customHeaders;


- (User *)initUserWithJson:(NSDictionary *)json
{
    if ((self = [super init]))
    {
        self.ID = [json valueForKey:@"UserID"];
        self.relUserGroupID = [json valueForKey:@"RelUserGroupID"];
        self.emailAddress = [json valueForKey:@"EmailAddress"];
        self.username = [json valueForKey:@"Username"];
        self.password = [json valueForKey:@"Password"];
        self.reputationLevel = [json valueForKey:@"ReputationLevel"];
        self.userSince = [json valueForKey:@"UserSince"];
        self.firstName = [json valueForKey:@"FirstName"];
        self.lastName = [json valueForKey:@"LastName"];
        self.name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        self.companyName = [json valueForKey:@"CompanyName"];
        self.website = [json valueForKey:@"Website"];
        self.street = [json valueForKey:@"Street"];
        self.city = [json valueForKey:@"City"];
        self.state = [json valueForKey:@"State"];
        self.zip = [json valueForKey:@"Zip"];
        self.country = [json valueForKey:@"Country"];
        self.phone = [json valueForKey:@"Phone"];
        self.fax = [json valueForKey:@"Fax"];
        self.timeZone = [json valueForKey:@"TimeZone"];
        self.signUpIPAddress = [json valueForKey:@"SignUpIPAddress"];
        self.APIKey = [json valueForKey:@"APIKey"];
        self.language = [json valueForKey:@"Language"];
        self.lastActivityDateTime = [json valueForKey:@"LastActivityDateTime"];
        self.previewMyEmailAccount = [json valueForKey:@"PreviewMyEmailAccount"];
        self.previewMyEmailAPIKey = [json valueForKey:@"PreviewMyEmailAccount"];
        self.forwardToFriendHeader = [json valueForKey:@"ForwardToFriendHeader"];
        self.forwardToFriendFooter = [json valueForKey:@"ForwardToFriendFooter"];
        self.accountStatus = [json valueForKey:@"AccountStatus"];
        self.availableCredits = [json valueForKey:@"AvailableCredits"];
        self.customHeaders = [json valueForKey:@"CustomHeaders"];
    }
    return self;
}

+ (void)getUser:(NSString *)userID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"User.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID",
                                userID, @"UserID", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

@end
