//
//  ListViewController.h
//  Leeva
//
//  Created by Adelino Faria on 4/11/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Leeva.h"


@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, LeevaDelegate> {
    
}

@property (nonatomic, retain) NSMutableArray *itemsList;
@property (nonatomic, retain) UILabel *noResults;
@property (nonatomic, retain) UITableViewController *listTableViewController;
@property (nonatomic, retain) UINavigationController *listNavigationController;

@end
