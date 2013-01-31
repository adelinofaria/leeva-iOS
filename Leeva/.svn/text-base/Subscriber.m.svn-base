//
//  Subscriber.m
//  Leeva
//
//  Created by Adelino Faria on 3/30/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "Subscriber.h"
#import "LeevaRequest.h"


@implementation Subscriber

+ (void)searchSubscribers:(NSString *)searchToken listID:(NSString *)list recordsFrom:(NSString *)recordsFrom recordsPerRequest:(NSString *)recordsPerRequest sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Subscribers.Search", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID",
                                list, @"ListID",
                                @"and", @"Operator",
                                [NSString stringWithFormat:@"[[EmailAddress]||[Contains]||[%@]]", searchToken], @"Rules",
                                recordsFrom, @"RecordsFrom",
                                recordsPerRequest, @"RecordsPerRequest",
                                0, @"OrderField",
                                0, @"OrderType", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)getSubscribers:(NSString *)list recordsFrom:(NSString *)recordsFrom recordsPerRequest:(NSString *)recordsPerRequest sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Subscribers.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID",
                                list, @"SubscriberListID",
                                @"Active", @"SubscriberSegment",
                                recordsFrom, @"RecordsFrom",
                                recordsPerRequest, @"RecordsPerRequest",
                                @"emailAddress", @"OrderField",
                                @"ASC", @"OrderType", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)getSubscriber:(NSString *)emailAddress fromList:(NSString *)list sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Subscriber.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID",
                                emailAddress, @"EmailAddress",
                                list, @"ListID", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)getSubscriberLists:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Subscriber.GetLists", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

@end
