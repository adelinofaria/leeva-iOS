//
//  Campaign.h
//  Leeva
//
//  Created by Adelino Faria on 3/23/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeevaResult.h"

typedef enum
{
    All,
    Draft,
    Ready,
    Sending,
    Paused,
    PendingApproval,
    Sent,
    Failed
}CampaignStatus;

@interface Campaign : NSObject {
    NSString *campaignID;
    NSString *relOwnerUserID;
    NSString *campaignStatus;
    NSString *campaignName;
    NSString *relEmailID;
    NSString *scheduleType;
    NSString *sendDate;
    NSString *sendTime;
    NSString *sendTimeZone;
    NSString *scheduleRecDaysOfWeek;
    NSString *scheduleRecDaysOfMonth;
    NSString *scheduleRecMonths;
    NSString *scheduleRecHours;
    NSString *scheduleRecMinutes;
    NSString *scheduleRecSendMaxInstance;
    NSString *scheduleRecSentInstances;
    NSString *sendProcessStartedOn;
    NSString *sendProcessFinishedOn;
    NSString *totalRecipients;
    NSString *totalSent;
    NSString *totalFailed;
    NSString *totalOpens;
    NSString *uniqueOpens;
    NSString *totalClicks;
    NSString *uniqueClicks;
    NSString *totalForwards;
    NSString *uniqueForwards;
    NSString *totalViewsOnBrowser;
    NSString *uniqueViewsOnBrowser;
    NSString *totalUnsubscriptions;
    NSString *totalHardBounces;
    NSString *totalSoftBounces;
    NSString *benchmarkEmailsPerSecond;
    NSString *approvalUserExplanation;
    NSString *googleAnalyticsDomains;
    NSString *publishOnRSS;
    NSString *lastActivityDateTime;
    NSArray *recipientLists;
    NSArray *recipientSegments;
    NSArray *tags;
    NSDictionary *openStatistics;
    NSDictionary *clickStatistics;
    NSDictionary *unsubscriptionStatistics;
    NSDictionary *forwardStatistics;
    NSDictionary *browserViewStatistics;
    NSArray *bounceStatistics;
    NSNumber *overallClickPerformance;
    NSArray *clickPerformance;
    NSNumber *overallAccountClickPerformance;
    NSNumber *overallOpenPerformance;
    NSArray *openPerformance;
    NSNumber *overallAccountOpenPerformance;
    NSArray *subscribersOpened;
    NSArray *subscribersClicked;
    NSNumber *splitTest;
    NSString *hardBounceRatio;
    NSString *softBounceRatio;
}

@property (nonatomic, retain) NSString *campaignID;
@property (nonatomic, retain) NSString *relOwnerUserID;
@property (nonatomic, retain) NSString *campaignStatus;
@property (nonatomic, retain) NSString *campaignName;
@property (nonatomic, retain) NSString *relEmailID;
@property (nonatomic, retain) NSString *scheduleType;
@property (nonatomic, retain) NSString *sendDate;
@property (nonatomic, retain) NSString *sendTime;
@property (nonatomic, retain) NSString *sendTimeZone;
@property (nonatomic, retain) NSString *scheduleRecDaysOfWeek;
@property (nonatomic, retain) NSString *scheduleRecDaysOfMonth;
@property (nonatomic, retain) NSString *scheduleRecMonths;
@property (nonatomic, retain) NSString *scheduleRecHours;
@property (nonatomic, retain) NSString *scheduleRecMinutes;
@property (nonatomic, retain) NSString *scheduleRecSendMaxInstance;
@property (nonatomic, retain) NSString *scheduleRecSentInstances;
@property (nonatomic, retain) NSString *sendProcessStartedOn;
@property (nonatomic, retain) NSString *sendProcessFinishedOn;
@property (nonatomic, retain) NSString *totalRecipients;
@property (nonatomic, retain) NSString *totalSent;
@property (nonatomic, retain) NSString *totalFailed;
@property (nonatomic, retain) NSString *totalOpens;
@property (nonatomic, retain) NSString *uniqueOpens;
@property (nonatomic, retain) NSString *totalClicks;
@property (nonatomic, retain) NSString *uniqueClicks;
@property (nonatomic, retain) NSString *totalForwards;
@property (nonatomic, retain) NSString *uniqueForwards;
@property (nonatomic, retain) NSString *totalViewsOnBrowser;
@property (nonatomic, retain) NSString *uniqueViewsOnBrowser;
@property (nonatomic, retain) NSString *totalUnsubscriptions;
@property (nonatomic, retain) NSString *totalHardBounces;
@property (nonatomic, retain) NSString *totalSoftBounces;
@property (nonatomic, retain) NSString *benchmarkEmailsPerSecond;
@property (nonatomic, retain) NSString *approvalUserExplanation;
@property (nonatomic, retain) NSString *googleAnalyticsDomains;
@property (nonatomic, retain) NSString *publishOnRSS;
@property (nonatomic, retain) NSString *lastActivityDateTime;
@property (nonatomic, retain) NSArray *recipientLists;
@property (nonatomic, retain) NSArray *recipientSegments;
@property (nonatomic, retain) NSArray *tags;
@property (nonatomic, retain) NSDictionary *openStatistics;
@property (nonatomic, retain) NSDictionary *clickStatistics;
@property (nonatomic, retain) NSDictionary *unsubscriptionStatistics;
@property (nonatomic, retain) NSDictionary *forwardStatistics;
@property (nonatomic, retain) NSDictionary *browserViewStatistics;
@property (nonatomic, retain) NSArray *bounceStatistics;
@property (nonatomic, retain) NSNumber *overallClickPerformance;
@property (nonatomic, retain) NSArray *clickPerformance;
@property (nonatomic, retain) NSNumber *overallAccountClickPerformance;
@property (nonatomic, retain) NSNumber *overallOpenPerformance;
@property (nonatomic, retain) NSArray *openPerformance;
@property (nonatomic, retain) NSNumber *overallAccountOpenPerformance;
@property (nonatomic, retain) NSArray *subscribersOpened;
@property (nonatomic, retain) NSArray *subscribersClicked;
@property (nonatomic, retain) NSNumber *splitTest;
@property (nonatomic, retain) NSString *hardBounceRatio;
@property (nonatomic, retain) NSString *softBounceRatio;

@property (nonatomic, readonly, getter = opensArray) NSArray *opensArray;
@property (nonatomic, readonly, getter = clicksArray) NSArray *clicksArray;
@property (nonatomic, readonly, getter = forwardsArray) NSArray *forwardsArray;
@property (nonatomic, readonly, getter = browserViewArray) NSArray *browserViewArray;
@property (nonatomic, readonly, getter = unsubscribesArray) NSArray *unsubscribesArray;

- (Campaign *)initCampaignWithJson:(NSDictionary *)json;

- (void)update:(NSDictionary *)json;

- (int)getOpensPercentage;
- (int)getClicksPercentage;
- (int)getForwardsPercentage;
- (int)getBrowserViewsPercentage;

+ (void)getCampaigns:(CampaignStatus)type sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;
+ (void)getCampaignsFiltered:(CampaignStatus)type sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate searchKeyword:(NSString *)searchKeyword;
+ (void)getCampaign:(NSString *)campaignID retrieveStatistics:(BOOL)retrieveStatistics sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;

@end
