//
//  Subscriber.h
//  Leeva
//
//  Created by Adelino Faria on 3/30/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeevaResult.h"


@interface Subscriber : NSObject {
    
}


+ (void)searchSubscribers:(NSString *)searchToken listID:(NSString *)list recordsFrom:(NSString *)recordsFrom recordsPerRequest:(NSString *)recordsPerRequest sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;
+ (void)getSubscribers:(NSString *)list recordsFrom:(NSString *)recordsFrom recordsPerRequest:(NSString *)recordsPerRequest sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;
+ (void)getSubscriber:(NSString *)emailAddress fromList:(NSString *)list sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;
+ (void)getSubscriberLists:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;

@end
