//
//  User.h
//  Leeva
//
//  Created by Adelino Faria on 3/21/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


@interface User : Person {
    NSString *relUserGroupID;
    NSString *reputationLevel;
    NSString *userSince;
    NSString *firstName;
    NSString *lastName;
    NSString *companyName;
    NSString *website;
    NSString *street;
    NSString *city;
    NSString *state;
    NSString *zip;
    NSString *country;
    NSString *phone;
    NSString *fax;
    NSString *timeZone;
    NSString *signUpIPAddress;
    NSString *APIKey;
    NSString *language;
    NSString *lastActivityDateTime;
    NSString *previewMyEmailAccount;
    NSString *previewMyEmailAPIKey;
    NSString *forwardToFriendHeader;
    NSString *forwardToFriendFooter;
    NSString *accountStatus;
    NSString *availableCredits;
    NSString *customHeaders;
}
@property (nonatomic, retain) NSString *relUserGroupID;
@property (nonatomic, retain) NSString *reputationLevel;
@property (nonatomic, retain) NSString *userSince;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *companyName;
@property (nonatomic, retain) NSString *website;
@property (nonatomic, retain) NSString *street;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *state;
@property (nonatomic, retain) NSString *zip;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *fax;
@property (nonatomic, retain) NSString *timeZone;
@property (nonatomic, retain) NSString *signUpIPAddress;
@property (nonatomic, retain) NSString *APIKey;
@property (nonatomic, retain) NSString *language;
@property (nonatomic, retain) NSString *lastActivityDateTime;
@property (nonatomic, retain) NSString *previewMyEmailAccount;
@property (nonatomic, retain) NSString *previewMyEmailAPIKey;
@property (nonatomic, retain) NSString *forwardToFriendHeader;
@property (nonatomic, retain) NSString *forwardToFriendFooter;
@property (nonatomic, retain) NSString *accountStatus;
@property (nonatomic, retain) NSString *availableCredits;
@property (nonatomic, retain) NSString *customHeaders;

- (User *)initUserWithJson:(NSDictionary *)json;

+ (void)getUser:(NSString *)userID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;

@end
