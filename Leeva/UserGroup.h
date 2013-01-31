//
//  UserGroup.h
//  Leeva
//
//  Created by Adelino Faria on 3/29/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeevaResult.h"


@interface UserGroup : NSObject {
    NSString *ID;
    NSString *groupName;
    NSString *relThemeID;
    NSString *subscriberAreaLogoutURL;
    NSString *forceUnsubscriptionLink;
    NSString *forceRejectOptLink;
    NSString *forceOptInList;
    NSString *permissions;
    NSString *paymentSystem;
    NSString *creditSystem;
    NSString *paymentPricingRange;
    NSString *paymentCampaignsPerRecipient;
    NSString *paymentCampaignsPerCampaignCost;
    NSString *paymentAutoRespondersChargeAmount;
    NSString *paymentAutoRespondersChargePeriod;
    NSString *paymentAutoRespondersPerRecipient;
    NSString *paymentDesignPrevChargeAmount;
    NSString *paymentDesignPrevChargePeriod;
    NSString *paymentDesignPrevChargePerReq;
    NSString *paymentSystemChargeAmount;
    NSString *paymentSystemChargePeriod;
    NSString *paymentCreditSystem;
    NSString *paymentCreditPricing;
    NSString *limitSubscribers;
    NSString *limitLists;
    NSString *limitCampaignSendPerPeriod;
    NSString *limitCampaignSendPeriod;
    NSString *limitEmailSendPerPeriod;
    NSString *limitEmailSendPeriod;
    NSString *thresholdImport;
    NSString *thresholdEmailSend;
    NSString *plainEmailHeader;
    NSString *plainEmailFooter;
    NSString *HTMLEmailHeader;
    NSString *HTMLEmailFooter;
    NSString *trialGroup;
    NSString *trialExpireSeconds;
    NSString *sendMethod;
    NSString *sendMethodLocalMTAPath;
    NSString *sendMethodPowerMTAVMTA;
    NSString *sendMethodPowerMTADir;
    NSString *sendMethodSaveToDiskDir;
    NSString *sendMethodSMTPHost;
    NSString *sendMethodSMTPPort;
    NSString *sendMethodSMTPSecure;
    NSString *sendMethodSMTPAuth;
    NSString *sendMethodSMTPUsername;
    NSString *sendMethodSMTPPassword;
    NSString *sendMethodSMTPTimeOut;
    NSString *sendMethodSMTPDebug;
    NSString *sendMethodSMTPKeepAlive;
    NSString *sendMethodSMTPMsgConn;
    NSString *xMailer;
    NSString *customHeaders;
}

@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSString *groupName;
@property (nonatomic, retain) NSString *relThemeID;
@property (nonatomic, retain) NSString *subscriberAreaLogoutURL;
@property (nonatomic, retain) NSString *forceUnsubscriptionLink;
@property (nonatomic, retain) NSString *forceRejectOptLink;
@property (nonatomic, retain) NSString *forceOptInList;
@property (nonatomic, retain) NSString *permissions;
@property (nonatomic, retain) NSString *paymentSystem;
@property (nonatomic, retain) NSString *creditSystem;
@property (nonatomic, retain) NSString *paymentPricingRange;
@property (nonatomic, retain) NSString *paymentCampaignsPerRecipient;
@property (nonatomic, retain) NSString *paymentCampaignsPerCampaignCost;
@property (nonatomic, retain) NSString *paymentAutoRespondersChargeAmount;
@property (nonatomic, retain) NSString *paymentAutoRespondersChargePeriod;
@property (nonatomic, retain) NSString *paymentAutoRespondersPerRecipient;
@property (nonatomic, retain) NSString *paymentDesignPrevChargeAmount;
@property (nonatomic, retain) NSString *paymentDesignPrevChargePeriod;
@property (nonatomic, retain) NSString *paymentDesignPrevChargePerReq;
@property (nonatomic, retain) NSString *paymentSystemChargeAmount;
@property (nonatomic, retain) NSString *paymentSystemChargePeriod;
@property (nonatomic, retain) NSString *paymentCreditSystem;
@property (nonatomic, retain) NSString *paymentCreditPricing;
@property (nonatomic, retain) NSString *limitSubscribers;
@property (nonatomic, retain) NSString *limitLists;
@property (nonatomic, retain) NSString *limitCampaignSendPerPeriod;
@property (nonatomic, retain) NSString *limitCampaignSendPeriod;
@property (nonatomic, retain) NSString *limitEmailSendPerPeriod;
@property (nonatomic, retain) NSString *limitEmailSendPeriod;
@property (nonatomic, retain) NSString *thresholdImport;
@property (nonatomic, retain) NSString *thresholdEmailSend;
@property (nonatomic, retain) NSString *plainEmailHeader;
@property (nonatomic, retain) NSString *plainEmailFooter;
@property (nonatomic, retain) NSString *HTMLEmailHeader;
@property (nonatomic, retain) NSString *HTMLEmailFooter;
@property (nonatomic, retain) NSString *trialGroup;
@property (nonatomic, retain) NSString *trialExpireSeconds;
@property (nonatomic, retain) NSString *sendMethod;
@property (nonatomic, retain) NSString *sendMethodLocalMTAPath;
@property (nonatomic, retain) NSString *sendMethodPowerMTAVMTA;
@property (nonatomic, retain) NSString *sendMethodPowerMTADir;
@property (nonatomic, retain) NSString *sendMethodSaveToDiskDir;
@property (nonatomic, retain) NSString *sendMethodSMTPHost;
@property (nonatomic, retain) NSString *sendMethodSMTPPort;
@property (nonatomic, retain) NSString *sendMethodSMTPSecure;
@property (nonatomic, retain) NSString *sendMethodSMTPAuth;
@property (nonatomic, retain) NSString *sendMethodSMTPUsername;
@property (nonatomic, retain) NSString *sendMethodSMTPPassword;
@property (nonatomic, retain) NSString *sendMethodSMTPTimeOut;
@property (nonatomic, retain) NSString *sendMethodSMTPDebug;
@property (nonatomic, retain) NSString *sendMethodSMTPKeepAlive;
@property (nonatomic, retain) NSString *sendMethodSMTPMsgConn;
@property (nonatomic, retain) NSString *xMailer;
@property (nonatomic, retain) NSString *customHeaders;

- (UserGroup *)initUserGroupWithJson:(NSDictionary *)json;

+ (void)getUserGroup:(NSString *)userGroupID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;

@end
