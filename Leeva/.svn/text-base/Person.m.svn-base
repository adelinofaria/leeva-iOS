//
//  Person.m
//  Leeva
//
//  Created by Adelino Faria on 3/23/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "Person.h"
#import "LeevaRequest.h"


@implementation Person

@synthesize ID;
@synthesize name;
@synthesize emailAddress;
@synthesize username;
@synthesize password;
@synthesize sessionID;

+ (void)loginAdmin:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Admin.Login", @"Command",
                                @"JSON", @"ResponseFormat",
                                username, @"Username",
                                password, @"Password", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)loginUser:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"User.Login", @"Command",
                                @"JSON", @"ResponseFormat",
                                username, @"Username",
                                password, @"Password", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)loginClient:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Client.Login", @"Command",
                                @"JSON", @"ResponseFormat",
                                username, @"Username",
                                password, @"Password", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)passwordRemindUser:(NSString *)email delegate:(id<LeevaDelegate>)delegate {
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"User.PasswordRemind", @"Command",
                                @"JSON", @"ResponseFormat",
                                email, @"EmailAddress", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)passwordRemindClient:(NSString *)email delegate:(id<LeevaDelegate>)delegate {
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Client.PasswordRemind", @"Command",
                                @"JSON", @"ResponseFormat",
                                email, @"EmailAddress", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

@end
