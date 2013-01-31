//
//  LeevaFacade.h
//  Leeva
//
//  Created by Adelino Faria on 3/21/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Leeva.h"


@interface LeevaFacade : NSObject <LeevaDelegate> {
    Person *person;
    NSArray *campaigns;
    NSArray *lists;
}

@property(nonatomic,retain)Person *person;
@property(nonatomic,retain)NSArray *campaigns;
@property(nonatomic,retain)NSArray *lists;

+ (LeevaFacade *)instance;

- (NSString *)getSessionID;
- (void)loginWithExistingCredentials:(UIViewController *)callerView;

+ (void)loginClient:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate;
+ (void)loginUser:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate;
+ (void)loginAdmin:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate;

+ (void)passwordRemindUser:(NSString *)email delegate:(id<LeevaDelegate>)delegate;
+ (void)passwordRemindClient:(NSString *)email delegate:(id<LeevaDelegate>)delegate;

- (void)getUser:(NSString *)userID delegate:(id<LeevaDelegate>)delegate;
- (void)getClients:orderField orderType:(NSString *)orderType delegate:(id<LeevaDelegate>)delegate;
- (void)searchSubscribers:(NSString *)searchToken listID:(NSString *)list recordsFrom:(NSString *)recordsFrom recordsPerRequest:(NSString *)recordsPerRequest delegate:(id<LeevaDelegate>)delegate;
- (void)getSubscribersLists:(id<LeevaDelegate>)delegate;
- (void)getSubscribers:(NSString *)list recordsFrom:(NSString *)recordsFrom recordsPerRequest:(NSString *)recordsPerRequest delegate:(id<LeevaDelegate>)delegate;
- (void)getSubscriber:(NSString *)emailAddress fromList:(NSString *)list delegate:(id<LeevaDelegate>)delegate;
- (void)getCampaigns:(CampaignStatus)type delegate:(id<LeevaDelegate>)delegate;
- (void)getCampaign:(NSString *)campaignID retrieveStatistics:(BOOL)retrieveStatistics delegate:(id<LeevaDelegate>)delegate;
- (void)getLists:(id<LeevaDelegate>)delegate;
- (void)getList:(NSString *)listID delegate:(id<LeevaDelegate>)delegate;
- (void)getEmails:(id<LeevaDelegate>)delegate;
- (void)getEmail:(NSString *)emailID delegate:(id<LeevaDelegate>)delegate;
- (void)getUserGroup:(NSString *)userGroupID delegate:(id<LeevaDelegate>)delegate;
- (void)getThemes:(id<LeevaDelegate>)delegate;
- (void)getTheme:(NSString *)themeID delegate:(id<LeevaDelegate>)delegate;

+ (void)requestReturn:(id<LeevaDelegate>)delegate result:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary;

@end
