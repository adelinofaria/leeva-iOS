//
//  Client.h
//  Leeva
//
//  Created by Adelino Faria on 3/22/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


@interface Client : Person {
    NSString *clientAccountStatus;
    NSString *relOwnerUserID;
    NSArray *assignedSubscriberLists;
    NSArray *assignedCampaigns;
}
@property (nonatomic, retain) NSString *clientAccountStatus;
@property (nonatomic, retain) NSString *relOwnerUserID;
@property (nonatomic, retain) NSArray *assignedSubscriberLists;
@property (nonatomic, retain) NSArray *assignedCampaigns;

- (Client *)initClientWithJson:(NSDictionary *)json;

+ (void)getClients:(NSString *)sessionID orderField:(NSString *)orderField orderType:(NSString *)orderType delegate:(id<LeevaDelegate>)delegate;

@end
