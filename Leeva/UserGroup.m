//
//  UserGroup.m
//  Leeva
//
//  Created by Adelino Faria on 3/29/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "UserGroup.h"
#import "LeevaRequest.h"


@implementation UserGroup

@synthesize ID;
@synthesize groupName;
@synthesize relThemeID;
@synthesize subscriberAreaLogoutURL;
@synthesize forceUnsubscriptionLink;
@synthesize forceRejectOptLink;
@synthesize forceOptInList;
@synthesize permissions;
@synthesize paymentSystem;
@synthesize creditSystem;
@synthesize paymentPricingRange;
@synthesize paymentCampaignsPerRecipient;
@synthesize paymentCampaignsPerCampaignCost;
@synthesize paymentAutoRespondersChargeAmount;
@synthesize paymentAutoRespondersChargePeriod;
@synthesize paymentAutoRespondersPerRecipient;
@synthesize paymentDesignPrevChargeAmount;
@synthesize paymentDesignPrevChargePeriod;
@synthesize paymentDesignPrevChargePerReq;
@synthesize paymentSystemChargeAmount;
@synthesize paymentSystemChargePeriod;
@synthesize paymentCreditSystem;
@synthesize paymentCreditPricing;
@synthesize limitSubscribers;
@synthesize limitLists;
@synthesize limitCampaignSendPerPeriod;
@synthesize limitCampaignSendPeriod;
@synthesize limitEmailSendPerPeriod;
@synthesize limitEmailSendPeriod;
@synthesize thresholdImport;
@synthesize thresholdEmailSend;
@synthesize plainEmailHeader;
@synthesize plainEmailFooter;
@synthesize HTMLEmailHeader;
@synthesize HTMLEmailFooter;
@synthesize trialGroup;
@synthesize trialExpireSeconds;
@synthesize sendMethod;
@synthesize sendMethodLocalMTAPath;
@synthesize sendMethodPowerMTAVMTA;
@synthesize sendMethodPowerMTADir;
@synthesize sendMethodSaveToDiskDir;
@synthesize sendMethodSMTPHost;
@synthesize sendMethodSMTPPort;
@synthesize sendMethodSMTPSecure;
@synthesize sendMethodSMTPAuth;
@synthesize sendMethodSMTPUsername;
@synthesize sendMethodSMTPPassword;
@synthesize sendMethodSMTPTimeOut;
@synthesize sendMethodSMTPDebug;
@synthesize sendMethodSMTPKeepAlive;
@synthesize sendMethodSMTPMsgConn;
@synthesize xMailer;
@synthesize customHeaders;

- (UserGroup *)initUserGroupWithJson:(NSDictionary *)json
{
    if ((self = [super init]))
    {
        self.ID = [json valueForKey:@"UserGroupID"];
        self.groupName = [json valueForKey:@"GroupName"];
        self.relThemeID = [json valueForKey:@"RelThemeID"];
        self.subscriberAreaLogoutURL = [json valueForKey:@"SubscriberAreaLogoutURL"];
        self.forceUnsubscriptionLink = [json valueForKey:@"ForceUnsubscriptionLink"];
        self.forceRejectOptLink = [json valueForKey:@"ForceRejectOptLink"];
        self.forceOptInList = [json valueForKey:@"ForceOptInList"];
        self.permissions = [json valueForKey:@"Permissions"];
        self.paymentSystem = [json valueForKey:@"PaymentSystem"];
        self.creditSystem = [json valueForKey:@"CreditSystem"];
        self.paymentPricingRange = [json valueForKey:@"PaymentPricingRange"];
        self.paymentCampaignsPerRecipient = [json valueForKey:@"PaymentCampaignsPerRecipient"];
        self.paymentCampaignsPerCampaignCost = [json valueForKey:@"PaymentCampaignsPerCampaignCost"];
        self.paymentAutoRespondersChargeAmount = [json valueForKey:@"PaymentAutoRespondersChargeAmount"];
        self.paymentAutoRespondersChargePeriod = [json valueForKey:@"PaymentAutoRespondersChargePeriod"];
        self.paymentAutoRespondersPerRecipient = [json valueForKey:@"PaymentAutoRespondersPerRecipient"];
        self.paymentDesignPrevChargeAmount = [json valueForKey:@"PaymentDesignPrevChargeAmount"];
        self.paymentDesignPrevChargePeriod = [json valueForKey:@"PaymentDesignPrevChargePeriod"];
        self.paymentDesignPrevChargePerReq = [json valueForKey:@"PaymentDesignPrevChargePerReq"];
        self.paymentSystemChargeAmount = [json valueForKey:@"PaymentSystemChargeAmount"];
        self.paymentSystemChargePeriod = [json valueForKey:@"PaymentSystemChargePeriod"];
        self.paymentCreditSystem = [json valueForKey:@"PaymentCreditSystem"];
        self.paymentCreditPricing = [json valueForKey:@"PaymentCreditPricing"];
        self.limitSubscribers = [json valueForKey:@"LimitSubscribers"];
        self.limitLists = [json valueForKey:@"LimitLists"];
        self.limitCampaignSendPerPeriod = [json valueForKey:@"LimitCampaignSendPerPeriod"];
        self.limitCampaignSendPeriod = [json valueForKey:@"LimitCampaignSendPeriod"];
        self.limitEmailSendPerPeriod = [json valueForKey:@"LimitEmailSendPerPeriod"];
        self.limitEmailSendPeriod = [json valueForKey:@"LimitEmailSendPeriod"];
        self.thresholdImport = [json valueForKey:@"ThresholdImport"];
        self.thresholdEmailSend = [json valueForKey:@"ThresholdEmailSend"];
        self.plainEmailHeader = [json valueForKey:@"PlainEmailHeader"];
        self.plainEmailFooter = [json valueForKey:@"PlainEmailFooter"];
        self.HTMLEmailHeader = [json valueForKey:@"HTMLEmailHeader"];
        self.HTMLEmailFooter = [json valueForKey:@"HTMLEmailFooter"];
        self.trialGroup = [json valueForKey:@"TrialGroup"];
        self.trialExpireSeconds = [json valueForKey:@"TrialExpireSeconds"];
        self.sendMethod = [json valueForKey:@"SendMethod"];
        self.sendMethodLocalMTAPath = [json valueForKey:@"SendMethodLocalMTAPath"];
        self.sendMethodPowerMTAVMTA = [json valueForKey:@"SendMethodPowerMTAVMTA"];
        self.sendMethodPowerMTADir = [json valueForKey:@"SendMethodPowerMTADir"];
        self.sendMethodSaveToDiskDir = [json valueForKey:@"SendMethodSaveToDiskDir"];
        self.sendMethodSMTPHost = [json valueForKey:@"SendMethodSMTPHost"];
        self.sendMethodSMTPPort = [json valueForKey:@"SendMethodSMTPPort"];
        self.sendMethodSMTPSecure = [json valueForKey:@"SendMethodSMTPSecure"];
        self.sendMethodSMTPAuth = [json valueForKey:@"SendMethodSMTPAuth"];
        self.sendMethodSMTPUsername = [json valueForKey:@"SendMethodSMTPUsername"];
        self.sendMethodSMTPPassword = [json valueForKey:@"SendMethodSMTPPassword"];
        self.sendMethodSMTPTimeOut = [json valueForKey:@"SendMethodSMTPTimeOut"];
        self.sendMethodSMTPDebug = [json valueForKey:@"SendMethodSMTPDebug"];
        self.sendMethodSMTPKeepAlive = [json valueForKey:@"SendMethodSMTPKeepAlive"];
        self.sendMethodSMTPMsgConn = [json valueForKey:@"SendMethodSMTPMsgConn"];
        self.xMailer = [json valueForKey:@"XMailer"];
        self.customHeaders = [json valueForKey:@"CustomHeaders"];
    }
    return self;
}

+ (void)getUserGroup:(NSString *)userGroupID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"UserGroup.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID",
                                userGroupID, @"UserGroupID", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

@end
