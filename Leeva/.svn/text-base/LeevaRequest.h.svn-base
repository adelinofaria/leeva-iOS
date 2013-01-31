//
//  LeevaRequest.h
//  Leeva
//
//  Created by Adelino Faria on 3/21/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeevaFacade.h"
#import "HttpRequest.h"

@interface LeevaRequest : NSObject {
    
}

+ (NSString *)baseUrl;

+ (void)sendRequest:(NSDictionary *)dictionary delegate:(id<LeevaDelegate>)delegate;
+ (void)sendRequestThreaded:(NSDictionary *)dictionary delegate:(id<LeevaDelegate>)delegate;
+ (void)threadSendRequest:(HttpRequest *)request;
+ (void)requestReturn:(id<LeevaDelegate>)delegate result:(NSData *)result fromRequest:(NSDictionary *)dictionary;

@end
