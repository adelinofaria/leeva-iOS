//
//  Campaign.m
//  Leeva
//
//  Created by Adelino Faria on 3/23/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "Campaign.h"
#import "LeevaRequest.h"


@implementation Campaign

@synthesize campaignID;
@synthesize relOwnerUserID;
@synthesize campaignStatus;
@synthesize campaignName;
@synthesize relEmailID;
@synthesize scheduleType;
@synthesize sendDate;
@synthesize sendTime;
@synthesize sendTimeZone;
@synthesize scheduleRecDaysOfWeek;
@synthesize scheduleRecDaysOfMonth;
@synthesize scheduleRecMonths;
@synthesize scheduleRecHours;
@synthesize scheduleRecMinutes;
@synthesize scheduleRecSendMaxInstance;
@synthesize scheduleRecSentInstances;
@synthesize sendProcessStartedOn;
@synthesize sendProcessFinishedOn;
@synthesize totalRecipients;
@synthesize totalSent;
@synthesize totalFailed;
@synthesize totalOpens;
@synthesize uniqueOpens;
@synthesize totalClicks;
@synthesize uniqueClicks;
@synthesize totalForwards;
@synthesize uniqueForwards;
@synthesize totalViewsOnBrowser;
@synthesize uniqueViewsOnBrowser;
@synthesize totalUnsubscriptions;
@synthesize totalHardBounces;
@synthesize totalSoftBounces;
@synthesize benchmarkEmailsPerSecond;
@synthesize approvalUserExplanation;
@synthesize googleAnalyticsDomains;
@synthesize publishOnRSS;
@synthesize lastActivityDateTime;
@synthesize recipientLists;
@synthesize recipientSegments;
@synthesize tags;
@synthesize openStatistics;
@synthesize clickStatistics;
@synthesize unsubscriptionStatistics;
@synthesize forwardStatistics;
@synthesize browserViewStatistics;
@synthesize bounceStatistics;
@synthesize overallClickPerformance;
@synthesize clickPerformance;
@synthesize overallAccountClickPerformance;
@synthesize overallOpenPerformance;
@synthesize openPerformance;
@synthesize overallAccountOpenPerformance;
@synthesize subscribersOpened;
@synthesize subscribersClicked;
@synthesize splitTest;
@synthesize hardBounceRatio;
@synthesize softBounceRatio;

@synthesize opensArray, clicksArray, forwardsArray, browserViewArray, unsubscribesArray;


- (Campaign *)initCampaignWithJson:(NSDictionary *)json
{
    if ((self = [super init]))
    {
        self.campaignID = [json valueForKey:@"CampaignID"];
        self.relOwnerUserID = [json valueForKey:@"RelOwnerUserID"];
        self.campaignStatus = [json valueForKey:@"CampaignStatus"];
        self.campaignName = [json valueForKey:@"CampaignName"];
        self.relEmailID = [json valueForKey:@"RelEmailID"];
        self.scheduleType = [json valueForKey:@"ScheduleType"];
        self.sendDate = [json valueForKey:@"SendDate"];
        self.sendTime = [json valueForKey:@"SendTime"];
        self.sendTimeZone = [json valueForKey:@"SendTimeZone"];
        self.scheduleRecDaysOfWeek = [json valueForKey:@"ScheduleRecDaysOfWeek"];
        self.scheduleRecDaysOfMonth = [json valueForKey:@"ScheduleRecDaysOfMonth"];
        self.scheduleRecMonths = [json valueForKey:@"ScheduleRecMonths"];
        self.scheduleRecHours = [json valueForKey:@"ScheduleRecHours"];
        self.scheduleRecMinutes = [json valueForKey:@"ScheduleRecMinutes"];
        self.scheduleRecSendMaxInstance = [json valueForKey:@"ScheduleRecSendMaxInstance"];
        self.scheduleRecSentInstances = [json valueForKey:@"ScheduleRecSentInstances"];
        self.sendProcessStartedOn = [json valueForKey:@"SendProcessStartedOn"];
        self.sendProcessFinishedOn = [json valueForKey:@"SendProcessFinishedOn"];
        self.totalRecipients = [json valueForKey:@"TotalRecipients"];
        self.totalSent = [json valueForKey:@"TotalSent"];
        self.totalFailed = [json valueForKey:@"TotalFailed"];
        self.totalOpens = [json valueForKey:@"TotalOpens"];
        self.uniqueOpens = [json valueForKey:@"UniqueOpens"];
        self.totalClicks = [json valueForKey:@"TotalClicks"];
        self.uniqueClicks = [json valueForKey:@"UniqueClicks"];
        self.totalForwards = [json valueForKey:@"TotalForwards"];
        self.uniqueForwards = [json valueForKey:@"UniqueForwards"];
        self.totalViewsOnBrowser = [json valueForKey:@"TotalViewsOnBrowser"];
        self.uniqueViewsOnBrowser = [json valueForKey:@"UniqueViewsOnBrowser"];
        self.totalUnsubscriptions = [json valueForKey:@"TotalUnsubscriptions"];
        self.totalHardBounces = [json valueForKey:@"TotalHardBounces"];
        self.totalSoftBounces = [json valueForKey:@"TotalSoftBounces"];
        self.benchmarkEmailsPerSecond = [json valueForKey:@"BenchmarkEmailsPerSecond"];
        self.approvalUserExplanation = [json valueForKey:@"ApprovalUserExplanation"];
        self.googleAnalyticsDomains = [json valueForKey:@"GoogleAnalyticsDomains"];
        self.publishOnRSS = [json valueForKey:@"PublishOnRSS"];
        self.lastActivityDateTime = [json valueForKey:@"LastActivityDateTime"];
        self.recipientLists = [json valueForKey:@"RecipientLists"];
        self.recipientSegments = [json valueForKey:@"RecipientSegments"];
        self.openStatistics = [json valueForKey:@"OpenStatistics"];
        self.clickStatistics = [json valueForKey:@"ClickStatistics"];
        self.unsubscriptionStatistics = [json valueForKey:@"UnsubscriptionStatistics"];
    }
    return self;
}

- (void)update:(NSDictionary *)json {
    self.campaignID = [json valueForKey:@"CampaignID"];
    self.relOwnerUserID = [json valueForKey:@"RelOwnerUserID"];
    self.campaignStatus = [json valueForKey:@"CampaignStatus"];
    self.campaignName = [json valueForKey:@"CampaignName"];
    self.relEmailID = [json valueForKey:@"RelEmailID"];
    self.scheduleType = [json valueForKey:@"ScheduleType"];
    self.sendDate = [json valueForKey:@"SendDate"];
    self.sendTime = [json valueForKey:@"SendTime"];
    self.sendTimeZone = [json valueForKey:@"SendTimeZone"];
    self.scheduleRecDaysOfWeek = [json valueForKey:@"ScheduleRecDaysOfWeek"];
    self.scheduleRecDaysOfMonth = [json valueForKey:@"ScheduleRecDaysOfMonth"];
    self.scheduleRecMonths = [json valueForKey:@"ScheduleRecMonths"];
    self.scheduleRecHours = [json valueForKey:@"ScheduleRecHours"];
    self.scheduleRecMinutes = [json valueForKey:@"ScheduleRecMinutes"];
    self.scheduleRecSendMaxInstance = [json valueForKey:@"ScheduleRecSendMaxInstance"];
    self.scheduleRecSentInstances = [json valueForKey:@"ScheduleRecSentInstances"];
    self.sendProcessStartedOn = [json valueForKey:@"SendProcessStartedOn"];
    self.sendProcessFinishedOn = [json valueForKey:@"SendProcessFinishedOn"];
    self.totalRecipients = [json valueForKey:@"TotalRecipients"];
    self.totalSent = [json valueForKey:@"TotalSent"];
    self.totalFailed = [json valueForKey:@"TotalFailed"];
    self.totalOpens = [json valueForKey:@"TotalOpens"];
    self.uniqueOpens = [json valueForKey:@"UniqueOpens"];
    self.totalClicks = [json valueForKey:@"TotalClicks"];
    self.uniqueClicks = [json valueForKey:@"UniqueClicks"];
    self.totalForwards = [json valueForKey:@"TotalForwards"];
    self.uniqueForwards = [json valueForKey:@"UniqueForwards"];
    self.totalViewsOnBrowser = [json valueForKey:@"TotalViewsOnBrowser"];
    self.uniqueViewsOnBrowser = [json valueForKey:@"UniqueViewsOnBrowser"];
    self.totalUnsubscriptions = [json valueForKey:@"TotalUnsubscriptions"];
    self.totalHardBounces = [json valueForKey:@"TotalHardBounces"];
    self.totalSoftBounces = [json valueForKey:@"TotalSoftBounces"];
    self.benchmarkEmailsPerSecond = [json valueForKey:@"BenchmarkEmailsPerSecond"];
    self.approvalUserExplanation = [json valueForKey:@"ApprovalUserExplanation"];
    self.googleAnalyticsDomains = [json valueForKey:@"GoogleAnalyticsDomains"];
    self.publishOnRSS = [json valueForKey:@"PublishOnRSS"];
    self.lastActivityDateTime = [json valueForKey:@"LastActivityDateTime"];
    self.recipientLists = [json valueForKey:@"RecipientLists"];
    self.recipientSegments = [json valueForKey:@"RecipientSegments"];
    self.tags = [json valueForKey:@"Tags"];
    self.openStatistics = [json valueForKey:@"OpenStatistics"];
    self.clickStatistics = [json valueForKey:@"ClickStatistics"];
    self.unsubscriptionStatistics = [json valueForKey:@"UnsubscriptionStatistics"];
    self.forwardStatistics = [json valueForKey:@"ForwardStatistics"];
    self.browserViewStatistics = [json valueForKey:@"BrowserViewStatistics"];
    self.bounceStatistics = [json valueForKey:@"BounceStatistics"];
    self.overallClickPerformance = [json valueForKey:@"OverallClickPerformance"];
    self.clickPerformance = [json valueForKey:@"ClickPerformance"];
    self.overallAccountClickPerformance = [json valueForKey:@"OverallAccountClickPerformance"];
    self.overallOpenPerformance = [json valueForKey:@"OverallOpenPerformance"];
    self.openPerformance = [json valueForKey:@"OpenPerformance"];
    self.overallAccountOpenPerformance = [json valueForKey:@"OverallAccountOpenPerformance"];
    self.subscribersOpened = [json valueForKey:@"SubscribersOpened"];
    self.subscribersClicked = [json valueForKey:@"SubscribersClicked"];
    self.splitTest = [json valueForKey:@"SplitTest"];
    self.hardBounceRatio = [json valueForKey:@"HardBounceRatio"];
    self.softBounceRatio = [json valueForKey:@"SoftBounceRatio"];
}

- (int)getOpensPercentage
{
    float sent = [self.totalSent floatValue];
    float open = [self.uniqueOpens floatValue];
    if (sent == 0 || open == 0)
        return 0;
    else {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
        int result = [[formatter stringFromNumber:[NSNumber numberWithFloat:(open/sent)*100]] intValue];
        [formatter release];
        return result;
    }
}

- (int)getClicksPercentage
{
    float sent = [self.totalSent floatValue];
    float clicks = [self.uniqueClicks floatValue];
    if (sent == 0 || clicks == 0)
        return 0;
    else {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
        int result = [[formatter stringFromNumber:[NSNumber numberWithFloat:(clicks/sent)*100]] intValue];
        return result;
    }
}

- (int)getForwardsPercentage
{
    float sent = [self.totalSent floatValue];
    float forwards = [self.uniqueForwards floatValue];
    if (sent == 0 || forwards == 0)
        return 0;
    else {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
        int result = [[formatter stringFromNumber:[NSNumber numberWithFloat:(forwards/sent)*100]] intValue];
        return result;
    }
}

- (int)getBrowserViewsPercentage
{
    float sent = [self.totalSent floatValue];
    float views = [self.uniqueViewsOnBrowser floatValue];
    if (sent == 0 || views == 0)
        return 0;
    else {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setRoundingMode: NSNumberFormatterRoundHalfUp];
        int result = [[formatter stringFromNumber:[NSNumber numberWithFloat:(views/sent)*100]] intValue];
        return result;
    }
}

- (NSArray *)opensArray
{
    return self.subscribersOpened;
}

- (NSArray *)clicksArray
{
    return self.subscribersClicked;
}

- (NSArray *)forwardsArray
{
    NSMutableArray *_itemsList = [[NSMutableArray alloc] init];
    for (NSDictionary *subscriber in self.subscribersOpened) {
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
    for (NSDictionary *subscriber in self.subscribersOpened) {
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

- (NSArray *)unsubscribesArray
{
    NSMutableArray *_itemsList = [[NSMutableArray alloc] init];
    for (NSDictionary *subscriber in self.subscribersOpened) {
        NSArray *activities = [subscriber objectForKey:@"Activities"];
        for (NSDictionary *activity in activities) {
            if([((NSString *)[activity objectForKey:@"activity"]) isEqualToString:@"Unsubscribed"])
            {
                NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
                [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                NSDate *sendData = [dateformater dateFromString:[activity objectForKey:@"time"]];
                [dateformater setDateFormat:@"dd.MM.yy"];
                
                NSDictionary *unsubscriber = [NSDictionary dictionaryWithObjectsAndKeys:[subscriber objectForKey:@"Email"], @"Email",
                                              [dateformater stringFromDate:sendData], @"Date",nil];
                [_itemsList addObject:unsubscriber];
                
                [dateformater release];
            }
        }
    }
    return _itemsList;
}

+ (void)getCampaigns:(CampaignStatus)type sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSString *_type;
    if (type == All)
        _type = @"All";
    else
        if (type == Draft)
            _type = @"Draft";
        else
            if (type == Ready)
                _type = @"Ready";
            else
                if (type == Sending)
                    _type = @"Sending";
                else
                    if (type == Paused)
                        _type = @"Paused";
                    else
                        if (type == PendingApproval)
                            _type = @"Pending Approval";
                        else
                            if (type == Sent)
                                _type = @"Sent";
                            else
                                if (type == Failed)
                                    _type = @"Failed";
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                sessionID, @"SessionID",
                                @"Campaigns.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                _type, @"CampaignStatus", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)getCampaignsFiltered:(CampaignStatus)type sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate searchKeyword:(NSString *)searchKeyword
{
    NSString *_type;
    if (type == All)
        _type = @"All";
    else
        if (type == Draft)
            _type = @"Draft";
        else
            if (type == Ready)
                _type = @"Ready";
            else
                if (type == Sending)
                    _type = @"Sending";
                else
                    if (type == Paused)
                        _type = @"Paused";
                    else
                        if (type == PendingApproval)
                            _type = @"Pending Approval";
                        else
                            if (type == Sent)
                                _type = @"Sent";
                            else
                                if (type == Failed)
                                    _type = @"Failed";
        
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                sessionID, @"SessionID",
                                @"Campaigns.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                _type, @"CampaignStatus",
                                searchKeyword, @"SearchKeyword", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)getCampaign:(NSString *)campaignID retrieveStatistics:(BOOL)retrieveStatistics sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                sessionID, @"SessionID",
                                @"Campaign.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                campaignID, @"CampaignID",
                                retrieveStatistics ? @"YES" : @"NO", @"RetrieveStatistics", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

@end
