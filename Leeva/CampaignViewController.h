//
//  CampaignViewController.h
//  Leeva
//
//  Created by Adelino Faria on 4/13/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Leeva.h"


@interface CampaignViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPopoverControllerDelegate, LeevaDelegate> {
    
}

@property (nonatomic, retain) NSMutableArray *itemsList;

@property (nonatomic, retain) UILabel *noResults;
@property (nonatomic, retain) UITableViewController *campaignTableViewController;
@property (nonatomic, retain) UINavigationController *campaignNavigationController;

@property (nonatomic, retain) UIButton *campaignComboBox;
@property (nonatomic, retain) UIPickerView *campaignPickerView;
@property (nonatomic, retain) UIPopoverController *campaignPopOverPickerView;

- (void)comboBoxSelected;
- (void)comboBoxSetup:(BOOL)pressed withTitle:(NSString *)title;

@end
