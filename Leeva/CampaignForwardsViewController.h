//
//  CampaignForwardsViewController.h
//  Leeva
//
//  Created by Adelino Faria on 5/9/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Leeva.h"


@interface CampaignForwardsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, LeevaDelegate> {
    
}

@property (nonatomic, retain, setter = setCampaign:) Campaign *campaign;
@property (nonatomic, retain) UIView *tableHeader;
@property (nonatomic, retain) UITableViewController *detailsTableViewController;

- (void)setCampaign:(Campaign *)campaign;

@end
