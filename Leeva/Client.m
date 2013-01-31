//
//  Client.m
//  Leeva
//
//  Created by Adelino Faria on 3/22/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "Client.h"
#import "LeevaRequest.h"


@implementation Client

@synthesize clientAccountStatus;
@synthesize relOwnerUserID;
@synthesize assignedSubscriberLists;
@synthesize assignedCampaigns;

- (Client *)initClientWithJson:(NSDictionary *)json
{
    if ((self = [super init]))
    {
        self.ID = [json valueForKey:@"ClientID"];
        self.username = [json valueForKey:@"ClientUsername"];
        self.password = [json valueForKey:@"ClientPassword"];
        self.emailAddress = [json valueForKey:@"ClientEmailAddress"];
        self.name = [json valueForKey:@"ClientName"];
        self.clientAccountStatus = [json valueForKey:@"ClientAccountStatus"];
        self.relOwnerUserID = [json valueForKey:@"RelOwnerUserID"];
        self.assignedSubscriberLists = [json valueForKey:@"AssignedSubscriberLists"];
        self.assignedCampaigns = [json valueForKey:@"AssignedCampaigns"];
    }
    return self;
}

+ (void)getClients:(NSString *)sessionID orderField:(NSString *)orderField orderType:(NSString *)orderType delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Clients.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID",
                                orderField, @"OrderField",
                                orderType, @"OrderTYPE", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

@end
