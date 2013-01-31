//
//  Person.h
//  Leeva
//
//  Created by Adelino Faria on 3/23/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeevaResult.h"


@interface Person : NSObject {
    NSString *ID;
    NSString *name;
    NSString *emailAddress;
    NSString *username;
    NSString *password;
    NSString *sessionID;
}

@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *emailAddress;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *sessionID;

+ (void)loginAdmin:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate;
+ (void)loginUser:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate;
+ (void)loginClient:(NSString *)username password:(NSString *)password delegate:(id<LeevaDelegate>)delegate;

+ (void)passwordRemindUser:(NSString *)email delegate:(id<LeevaDelegate>)delegate;
+ (void)passwordRemindClient:(NSString *)email delegate:(id<LeevaDelegate>)delegate;
@end
