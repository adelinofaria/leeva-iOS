//
//  LeevaRequest.m
//  Leeva
//
//  Created by Adelino Faria on 3/21/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "LeevaRequest.h"
#import "JSON.h"

static NSString *baseUrl = @"http://esp.leeva.net/api.php";

@implementation LeevaRequest

+ (NSString *)baseUrl {
    return baseUrl;
}

+ (void)sendRequest:(NSDictionary *)dictionary delegate:(id<LeevaDelegate>)delegate
{
    //DEBUG
    if([dictionary valueForKey:@"Command"] == @"User.Login")
        NSLog(@"%@", dictionary);
    
    HttpRequest *request = [[HttpRequest alloc] initWithURL:[NSURL URLWithString:baseUrl] requestType:POST dictionary:dictionary delegate:delegate];
    [request request];
    [request release];
}

+ (void)sendRequestThreaded:(NSDictionary *)dictionary delegate:(id<LeevaDelegate>)delegate
{
    HttpRequest *request = [[HttpRequest alloc] initWithURL:[NSURL URLWithString:baseUrl] requestType:POST dictionary:dictionary delegate:delegate];
    [NSThread detachNewThreadSelector:@selector(threadSendRequest:) toTarget:request withObject:nil];
    [request release];
}

+ (void)threadSendRequest:(HttpRequest *)request
{
    [request retain];
    NSData *data = [request syncRequest];
    [LeevaRequest requestReturn:request.delegate result:data fromRequest:request.dictionary];
    [request release];
}

+ (void)requestReturn:(id<LeevaDelegate>)delegate result:(NSData *)result fromRequest:(NSDictionary *)dictionary
{
    //DEBUG
    if([dictionary valueForKey:@"Command"] == @"User.Login")
        NSLog(@"%@", [[[NSString alloc] initWithData:result encoding:NSASCIIStringEncoding] autorelease]);
    
    static BOOL didNoticeNoConnection = FALSE;
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    if ([result isKindOfClass:[NSString class]]) {
        if ([(NSString *)result hasPrefix:@"Connection failed:"] && !didNoticeNoConnection) {
            [[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"error_no_connection_title", @"") message:NSLocalizedString(@"error_no_connection", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"") otherButtonTitles:nil] autorelease] show];
            didNoticeNoConnection = TRUE;
        }
    }
    else {
        [LeevaFacade requestReturn:delegate result:[parser objectWithData:result] fromRequest:dictionary];
        didNoticeNoConnection = FALSE;
    }
    
    [parser release];
}

@end
