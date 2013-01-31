//
//  List.m
//  Leeva
//
//  Created by Adelino Faria on 3/30/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "List.h"
#import "LeevaRequest.h"


@implementation List

@synthesize listID;
@synthesize name;
@synthesize optInMode;
@synthesize relOptInConfirmationEmailID;
@synthesize optOutScope;
@synthesize optOutAddToSuppressionList;
@synthesize createdOn;
@synthesize relOwnerUserID;
@synthesize sendServiceIntegrationFailedNotification;
@synthesize subscriptionConfirmationPendingPageURL;
@synthesize subscriptionConfirmedPageURL;
@synthesize subscriptionErrorPageURL;
@synthesize unsubscriptionConfirmedPageURL;
@synthesize unsubscriptionErrorPageURL;
@synthesize hideInSubscriberArea;
@synthesize reqByEmailSearchToAddress;
@synthesize reqByEmailSubscriptionCommand;
@synthesize reqByEmailUnsubscriptionCommand;
@synthesize syncStatus;
@synthesize syncPeriod;
@synthesize syncMySQLHost;
@synthesize syncMySQLPort;
@synthesize syncMySQLUsername;
@synthesize syncMySQLPassword;
@synthesize syncMySQLDBName;
@synthesize syncMySQLQuery;
@synthesize syncSendReportEmail;
@synthesize syncFieldMapping;
@synthesize syncLastDateTime;
@synthesize optInSubscribeTo;
@synthesize optInUnsubscribeFrom;
@synthesize optOutSubscribeTo;
@synthesize optOutUnsubscribeFrom;
@synthesize sendActivityNotification;
@synthesize optOutAddToGlobalSuppressionList;
@synthesize subscriberCount;
@synthesize emailDomainStatistics;
@synthesize bounceStatistics;
@synthesize activityStatistics;
@synthesize openStatistics;
@synthesize clickStatistics;
@synthesize forwardStatistics;
@synthesize browserViewStatistics;
@synthesize openPerformance;
@synthesize clickPerformance;
@synthesize overallOpenPerformance;
@synthesize overallClickPerformance;
@synthesize overallAccountClickPerformance;
@synthesize overallAccountOpenPerformance;
@synthesize totalSpamComplaints;
@synthesize encryptedSaltedListID;

@synthesize subscriberArray;

@synthesize opensArray, clicksArray, forwardsArray, browserViewArray;

- (List *)initListWithJson:(NSDictionary *)json
{
    if ((self = [super init]))
    {
        self.listID = [json valueForKey:@"ListID"];
        self.name = [json valueForKey:@"Name"];
        self.optInMode = [json valueForKey:@"OptInMode"];
        self.relOptInConfirmationEmailID = [json valueForKey:@"RelOptInConfirmationEmailID"];
        self.optOutScope = [json valueForKey:@"OptOutScope"];
        self.optOutAddToSuppressionList = [json valueForKey:@"OptOutAddToSuppressionList"];
        self.createdOn = [json valueForKey:@"CreatedOn"];
        self.relOwnerUserID = [json valueForKey:@"RelOwnerUserID"];
        self.sendServiceIntegrationFailedNotification = [json valueForKey:@"SendServiceIntegrationFailedNotification"];
        self.subscriptionConfirmationPendingPageURL = [json valueForKey:@"SubscriptionConfirmationPendingPageURL"];
        self.subscriptionConfirmedPageURL = [json valueForKey:@"SubscriptionConfirmedPageURL"];
        self.subscriptionErrorPageURL = [json valueForKey:@"SubscriptionErrorPageURL"];
        self.unsubscriptionConfirmedPageURL = [json valueForKey:@"UnsubscriptionConfirmedPageURL"];
        self.unsubscriptionErrorPageURL = [json valueForKey:@"UnsubscriptionErrorPageURL"];
        self.hideInSubscriberArea = [json valueForKey:@"HideInSubscriberArea"];
        self.reqByEmailSearchToAddress = [json valueForKey:@"ReqByEmailSearchToAddress"];
        self.reqByEmailSubscriptionCommand = [json valueForKey:@"ReqByEmailSubscriptionCommand"];
        self.reqByEmailUnsubscriptionCommand = [json valueForKey:@"ReqByEmailUnsubscriptionCommand"];
        self.syncStatus = [json valueForKey:@"SyncStatus"];
        self.syncPeriod = [json valueForKey:@"SyncPeriod"];
        self.syncMySQLHost = [json valueForKey:@"SyncMySQLHost"];
        self.syncMySQLPort = [json valueForKey:@"SyncMySQLPort"];
        self.syncMySQLUsername = [json valueForKey:@"SyncMySQLUsername"];
        self.syncMySQLPassword = [json valueForKey:@"SyncMySQLPassword"];
        self.syncMySQLDBName = [json valueForKey:@"SyncMySQLDBName"];
        self.syncMySQLQuery = [json valueForKey:@"SyncMySQLQuery"];
        self.syncSendReportEmail = [json valueForKey:@"SyncSendReportEmail"];
        self.syncFieldMapping = [json valueForKey:@"SyncFieldMapping"];
        self.syncLastDateTime = [json valueForKey:@"SyncLastDateTime"];
        self.optInSubscribeTo = [json valueForKey:@"OptInSubscribeTo"];
        self.optInUnsubscribeFrom = [json valueForKey:@"OptInUnsubscribeFrom"];
        self.optOutSubscribeTo = [json valueForKey:@"OptOutSubscribeTo"];
        self.optOutUnsubscribeFrom = [json valueForKey:@"optOutUnsubscribeFrom"];
        self.sendActivityNotification = [json valueForKey:@"SendActivityNotification"];
        self.optOutAddToGlobalSuppressionList = [json valueForKey:@"OptOutAddToGlobalSuppressionList"];
        self.subscriberCount = [json valueForKey:@"SubscriberCount"];
        self.encryptedSaltedListID = [json valueForKey:@"EncryptedSaltedListID"];
    }
    return self;
}

- (void)update:(NSDictionary *)json {
    self.listID = [json valueForKey:@"ListID"];
    self.name = [json valueForKey:@"Name"];
    self.optInMode = [json valueForKey:@"OptInMode"];
    self.relOptInConfirmationEmailID = [json valueForKey:@"RelOptInConfirmationEmailID"];
    self.optOutScope = [json valueForKey:@"OptOutScope"];
    self.optOutAddToSuppressionList = [json valueForKey:@"OptOutAddToSuppressionList"];
    self.createdOn = [json valueForKey:@"CreatedOn"];
    self.relOwnerUserID = [json valueForKey:@"RelOwnerUserID"];
    self.sendServiceIntegrationFailedNotification = [json valueForKey:@"SendServiceIntegrationFailedNotification"];
    self.subscriptionConfirmationPendingPageURL = [json valueForKey:@"SubscriptionConfirmationPendingPageURL"];
    self.subscriptionConfirmedPageURL = [json valueForKey:@"SubscriptionConfirmedPageURL"];
    self.subscriptionErrorPageURL = [json valueForKey:@"SubscriptionErrorPageURL"];
    self.unsubscriptionConfirmedPageURL = [json valueForKey:@"UnsubscriptionConfirmedPageURL"];
    self.unsubscriptionErrorPageURL = [json valueForKey:@"UnsubscriptionErrorPageURL"];
    self.hideInSubscriberArea = [json valueForKey:@"HideInSubscriberArea"];
    self.reqByEmailSearchToAddress = [json valueForKey:@"ReqByEmailSearchToAddress"];
    self.reqByEmailSubscriptionCommand = [json valueForKey:@"ReqByEmailSubscriptionCommand"];
    self.reqByEmailUnsubscriptionCommand = [json valueForKey:@"ReqByEmailUnsubscriptionCommand"];
    self.syncStatus = [json valueForKey:@"SyncStatus"];
    self.syncPeriod = [json valueForKey:@"SyncPeriod"];
    self.syncMySQLHost = [json valueForKey:@"SyncMySQLHost"];
    self.syncMySQLPort = [json valueForKey:@"SyncMySQLPort"];
    self.syncMySQLUsername = [json valueForKey:@"SyncMySQLUsername"];
    self.syncMySQLPassword = [json valueForKey:@"SyncMySQLPassword"];
    self.syncMySQLDBName = [json valueForKey:@"SyncMySQLDBName"];
    self.syncMySQLQuery = [json valueForKey:@"SyncMySQLQuery"];
    self.syncSendReportEmail = [json valueForKey:@"SyncSendReportEmail"];
    self.syncFieldMapping = [json valueForKey:@"SyncFieldMapping"];
    self.syncLastDateTime = [json valueForKey:@"SyncLastDateTime"];
    self.optInSubscribeTo = [json valueForKey:@"OptInSubscribeTo"];
    self.optInUnsubscribeFrom = [json valueForKey:@"OptInUnsubscribeFrom"];
    self.optOutSubscribeTo = [json valueForKey:@"OptOutSubscribeTo"];
    self.optOutUnsubscribeFrom = [json valueForKey:@"optOutUnsubscribeFrom"];
    self.sendActivityNotification = [json valueForKey:@"SendActivityNotification"];
    self.optOutAddToGlobalSuppressionList = [json valueForKey:@"OptOutAddToGlobalSuppressionList"];
    self.subscriberCount = [json valueForKey:@"SubscriberCount"];
    self.emailDomainStatistics = [json valueForKey:@"EmailDomainStatistics"];
    self.bounceStatistics = [json valueForKey:@"BounceStatistics"];
    self.activityStatistics = [json valueForKey:@"ActivityStatistics"];
    self.openStatistics = [json valueForKey:@"OpenStatistics"];
    self.clickStatistics = [json valueForKey:@"ClickStatistics"];
    self.forwardStatistics = [json valueForKey:@"ForwardStatistics"];
    self.browserViewStatistics = [json valueForKey:@"BrowserViewStatistics"];
    self.openPerformance = [json valueForKey:@"OpenPerformance"];
    self.clickPerformance = [json valueForKey:@"ClickPerformance"];
    self.overallOpenPerformance = [json valueForKey:@"OverallOpenPerformance"];
    self.overallClickPerformance = [json valueForKey:@"OverallClickPerformance"];
    self.overallAccountClickPerformance = [json valueForKey:@"overallAccountClickPerformance"];
    self.overallAccountOpenPerformance = [json valueForKey:@"OverallAccountOpenPerformance"];
    self.totalSpamComplaints = [json valueForKey:@"TotalSpamComplaints"];
    self.encryptedSaltedListID = [json valueForKey:@"EncryptedSaltedListID"];
}

- (void)addSubscriberList:(NSArray *)subscribers {
    self.subscriberArray = subscribers;
}

- (int)opensPercentage {
    return [self.overallOpenPerformance intValue];
}

- (int)clicksPercentage {
    return [self.overallClickPerformance intValue];
}

- (int)forwardsPercentage {
    //API doesn't return yet.
    return 0;
}

- (int)browserViewsPercentage {
    //API doesn't return yet.
    return 0;
}

- (NSString *)bouncesPercentage {
    if ([self.bounceStatistics count] == 3) {
        float hardBounced = [[[self.bounceStatistics objectAtIndex:1] objectForKey:@"count"] floatValue];
        float softBounced = [[[self.bounceStatistics objectAtIndex:2] objectForKey:@"count"] floatValue];
        
        if (hardBounced == 0 && softBounced == 0)
            return @"0";
        else {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setMaximumFractionDigits:2];
            [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
            NSString *result = [formatter stringFromNumber:[NSNumber numberWithFloat:((hardBounced+softBounced)/[self.subscriberCount floatValue])*100]];
            [formatter release];
            return result;
        }
    }
    else
        return @"0";
}

- (NSString *)notBouncedPercentage {
    if ([self.bounceStatistics count] == 3) {
        float notBounced = [[[self.bounceStatistics objectAtIndex:0] objectForKey:@"count"] floatValue];
        
        if (notBounced == 0)
            return @"0";
        else {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setMaximumFractionDigits:2];
            [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
            NSString *result = [formatter stringFromNumber:[NSNumber numberWithFloat:(notBounced/[self.subscriberCount floatValue])*100]];
            [formatter release];
            return result;
        }
    }
    else
        return @"0";
}

- (NSString *)hardBouncePercentage {
    if ([self.bounceStatistics count] == 3) {
        float hardBounced = [[[self.bounceStatistics objectAtIndex:1] objectForKey:@"count"] floatValue];
        
        if (hardBounced == 0)
            return @"0";
        else {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setMaximumFractionDigits:2];
            [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
            NSString *result = [formatter stringFromNumber:[NSNumber numberWithFloat:(hardBounced/[self.subscriberCount floatValue])*100]];
            [formatter release];
            return result;
        }
    }
    else
        return @"0";
}

- (NSString *)softBouncePercentage {
    if ([self.bounceStatistics count] == 3) {
        float softBounced = [[[self.bounceStatistics objectAtIndex:2] objectForKey:@"count"] floatValue];
        
        if (softBounced == 0)
            return @"0";
        else {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setMaximumFractionDigits:2];
            [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
            NSString *result = [formatter stringFromNumber:[NSNumber numberWithFloat:(softBounced/[self.subscriberCount floatValue])*100]];
            [formatter release];
            return result;
        }
    }
    else
        return @"0";
}

- (NSString *)emailDomainPercentage:(int)row {
    if ([self.emailDomainStatistics count] != 0) {
        float count = [[[self.emailDomainStatistics objectAtIndex:row] objectForKey:@"count"] floatValue];
        
        if (count == 0)
            return @"0";
        else {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setMaximumFractionDigits:2];
            [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
            NSString *result = [formatter stringFromNumber:[NSNumber numberWithFloat:(count/[self.subscriberCount floatValue])*100]];
            [formatter release];
            return result;
        }
    }
    else
        return @"0";
}

- (NSArray *)opensArray
{
    return self.openPerformance;
}

- (NSArray *)clicksArray
{
    return self.clickPerformance;
}

- (NSArray *)forwardsArray
{
    // Erro e incompleto
    NSMutableArray *_itemsList = [[NSMutableArray alloc] init];
    for (NSDictionary *subscriber in self.forwardStatistics) {
        NSArray *activities = [subscriber objectForKey:@"Activities"];
        for (NSDictionary *activity in activities) {
            if([((NSString *)[activity objectForKey:@"activity"]) isEqualToString:@"Email Forwarded"])
            {
                BOOL added = FALSE;
                for (NSMutableDictionary *item in _itemsList) {
                    if ([[item objectForKey:@"Email"] isEqualToString:[subscriber objectForKey:@"Email"]])
                    {
                        int value = [[item objectForKey:@"Value"] intValue];
                        value++;
                        [item setValue:[NSString stringWithFormat:@"%d", value] forKey:@"Value"];
                        added = TRUE;
                    }
                }
                if (!added) {
                    NSMutableDictionary *browserview = [NSMutableDictionary dictionaryWithObjectsAndKeys:[subscriber objectForKey:@"Email"], @"Email", @"1", @"Value",nil];
                    [_itemsList addObject:browserview];
                }
            }
        }
    }
    return _itemsList;
}

- (NSArray *)browserViewArray
{
    NSMutableArray *_itemsList = [[NSMutableArray alloc] init];
    for (NSDictionary *subscriber in self.browserViewStatistics) {
        NSArray *activities = [subscriber objectForKey:@"Activities"];
        for (NSDictionary *activity in activities) {
            if([[activity objectForKey:@"activity"] isEqualToString:@"Browser View"])
            {
                BOOL added = FALSE;
                for (NSMutableDictionary *item in _itemsList) {
                    if ([[item objectForKey:@"Email"] isEqualToString:[subscriber objectForKey:@"Email"]])
                    {
                        int value = [[item objectForKey:@"Value"] intValue];
                        value++;
                        [item setValue:[NSString stringWithFormat:@"%d", value] forKey:@"Value"];
                        added = TRUE;
                    }
                }
                if (!added) {
                    NSMutableDictionary *browserview = [NSMutableDictionary dictionaryWithObjectsAndKeys:[subscriber objectForKey:@"Email"], @"Email", @"1", @"Value",nil];
                    [_itemsList addObject:browserview];
                }
            }
        }
    }
    return _itemsList;
}

+ (void)getLists:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                sessionID, @"SessionID",
                                @"Lists.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                @"listid", @"OrderField", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)getList:(NSString *)listID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                sessionID, @"SessionID",
                                @"List.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                listID, @"ListID", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

@end
