//
//  RootTabBarViewController.h
//  Leeva
//
//  Created by Adelino Faria on 4/7/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Leeva.h"

@class OverviewViewController;
@class CampaignViewController;
@class ListViewController;
@class SubscriberViewController;


@interface RootTabBarViewController : UITabBarController <UITabBarControllerDelegate>{
    
}

@property (nonatomic, retain) OverviewViewController *overviewViewController;
@property (nonatomic, retain) CampaignViewController *campaignViewController;
@property (nonatomic, retain) ListViewController *listViewController;
@property (nonatomic, retain) SubscriberViewController *subscriberViewController;

@end
