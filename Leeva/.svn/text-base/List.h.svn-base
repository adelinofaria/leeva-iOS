//
//  List.h
//  Leeva
//
//  Created by Adelino Faria on 3/30/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeevaResult.h"

@interface List : NSObject {
    NSString *listID;
    NSString *name;
    NSString *optInMode;
    NSString *relOptInConfirmationEmailID;
    NSString *optOutScope;
    NSString *optOutAddToSuppressionList;
    NSString *createdOn;
    NSString *relOwnerUserID;
    NSString *sendServiceIntegrationFailedNotification;
    NSString *subscriptionConfirmationPendingPageURL;
    NSString *subscriptionConfirmedPageURL;
    NSString *subscriptionErrorPageURL;
    NSString *unsubscriptionConfirmedPageURL;
    NSString *unsubscriptionErrorPageURL;
    NSString *hideInSubscriberArea;
    NSString *reqByEmailSearchToAddress;
    NSString *reqByEmailSubscriptionCommand;
    NSString *reqByEmailUnsubscriptionCommand;
    NSString *syncStatus;
    NSString *syncPeriod;
    NSString *syncMySQLHost;
    NSString *syncMySQLPort;
    NSString *syncMySQLUsername;
    NSString *syncMySQLPassword;
    NSString *syncMySQLDBName;
    NSString *syncMySQLQuery;
    NSString *syncSendReportEmail;
    NSString *syncFieldMapping;
    NSString *syncLastDateTime;
    NSString *optInSubscribeTo;
    NSString *optInUnsubscribeFrom;
    NSString *optOutSubscribeTo;
    NSString *optOutUnsubscribeFrom;
    NSString *sendActivityNotification;
    NSString *optOutAddToGlobalSuppressionList;
    NSString *subscriberCount;
    NSArray *emailDomainStatistics;
    NSArray *bounceStatistics;
    NSDictionary *activityStatistics;
    NSDictionary *openStatistics;
    NSDictionary *clickStatistics;
    NSDictionary *forwardStatistics;
    NSDictionary *browserViewStatistics;
    NSArray *openPerformance;
    NSArray *clickPerformance;
    NSNumber *overallOpenPerformance;
    NSNumber *overallClickPerformance;
    NSNumber *overallAccountClickPerformance;
    NSNumber *overallAccountOpenPerformance;
    NSString *totalSpamComplaints;
    NSString *encryptedSaltedListID;
    
    NSArray *subscriberArray;
}

@property (nonatomic, retain) NSString *listID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *optInMode;
@property (nonatomic, retain) NSString *relOptInConfirmationEmailID;
@property (nonatomic, retain) NSString *optOutScope;
@property (nonatomic, retain) NSString *optOutAddToSuppressionList;
@property (nonatomic, retain) NSString *createdOn;
@property (nonatomic, retain) NSString *relOwnerUserID;
@property (nonatomic, retain) NSString *sendServiceIntegrationFailedNotification;
@property (nonatomic, retain) NSString *subscriptionConfirmationPendingPageURL;
@property (nonatomic, retain) NSString *subscriptionConfirmedPageURL;
@property (nonatomic, retain) NSString *subscriptionErrorPageURL;
@property (nonatomic, retain) NSString *unsubscriptionConfirmedPageURL;
@property (nonatomic, retain) NSString *unsubscriptionErrorPageURL;
@property (nonatomic, retain) NSString *hideInSubscriberArea;
@property (nonatomic, retain) NSString *reqByEmailSearchToAddress;
@property (nonatomic, retain) NSString *reqByEmailSubscriptionCommand;
@property (nonatomic, retain) NSString *reqByEmailUnsubscriptionCommand;
@property (nonatomic, retain) NSString *syncStatus;
@property (nonatomic, retain) NSString *syncPeriod;
@property (nonatomic, retain) NSString *syncMySQLHost;
@property (nonatomic, retain) NSString *syncMySQLPort;
@property (nonatomic, retain) NSString *syncMySQLUsername;
@property (nonatomic, retain) NSString *syncMySQLPassword;
@property (nonatomic, retain) NSString *syncMySQLDBName;
@property (nonatomic, retain) NSString *syncMySQLQuery;
@property (nonatomic, retain) NSString *syncSendReportEmail;
@property (nonatomic, retain) NSString *syncFieldMapping;
@property (nonatomic, retain) NSString *syncLastDateTime;
@property (nonatomic, retain) NSString *optInSubscribeTo;
@property (nonatomic, retain) NSString *optInUnsubscribeFrom;
@property (nonatomic, retain) NSString *optOutSubscribeTo;
@property (nonatomic, retain) NSString *optOutUnsubscribeFrom;
@property (nonatomic, retain) NSString *sendActivityNotification;
@property (nonatomic, retain) NSString *optOutAddToGlobalSuppressionList;
@property (nonatomic, retain) NSString *subscriberCount;
@property (nonatomic, retain) NSArray *emailDomainStatistics;
@property (nonatomic, retain) NSArray *bounceStatistics;
@property (nonatomic, retain) NSDictionary *activityStatistics;
@property (nonatomic, retain) NSDictionary *openStatistics;
@property (nonatomic, retain) NSDictionary *clickStatistics;
@property (nonatomic, retain) NSDictionary *forwardStatistics;
@property (nonatomic, retain) NSDictionary *browserViewStatistics;
@property (nonatomic, retain) NSArray *openPerformance;
@property (nonatomic, retain) NSArray *clickPerformance;
@property (nonatomic, retain) NSNumber *overallOpenPerformance;
@property (nonatomic, retain) NSNumber *overallClickPerformance;
@property (nonatomic, retain) NSNumber *overallAccountClickPerformance;
@property (nonatomic, retain) NSNumber *overallAccountOpenPerformance;
@property (nonatomic, retain) NSString *totalSpamComplaints;
@property (nonatomic, retain) NSString *encryptedSaltedListID;

@property (nonatomic, retain) NSArray *subscriberArray;

@property (nonatomic, readonly, getter = opensArray) NSArray *opensArray;
@property (nonatomic, readonly, getter = clicksArray) NSArray *clicksArray;
@property (nonatomic, readonly, getter = forwardsArray) NSArray *forwardsArray;
@property (nonatomic, readonly, getter = browserViewArray) NSArray *browserViewArray;

- (List *)initListWithJson:(NSDictionary *)json;

- (void)update:(NSDictionary *)json;
- (void)addSubscriberList:(NSArray *)subscribers;

- (int)opensPercentage;
- (int)clicksPercentage;
- (int)forwardsPercentage;
- (int)browserViewsPercentage;
- (NSString *)bouncesPercentage;
- (NSString *)notBouncedPercentage;
- (NSString *)hardBouncePercentage;
- (NSString *)softBouncePercentage;
- (NSString *)emailDomainPercentage:(int)row;

+ (void)getLists:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;
+ (void)getList:(NSString *)listID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;

@end
