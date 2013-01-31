//
//  HttpRequest.m
//  Leeva
//
//  Created by Adelino Faria on 3/21/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "HttpRequest.h"
#import "LeevaRequest.h"


@implementation HttpRequest

@synthesize delegate;
@synthesize url;
@synthesize type;
@synthesize dictionary;

- (HttpRequest *)initWithURL:(NSURL *)_url requestType:(HttpConnectionType)_type dictionary:(NSDictionary *)_dictionary delegate:(id)_delegate
{
    if ((self = [super init]))
    {
        self.dictionary = _dictionary;
        self.url = _url;
        self.type = _type;
        self.delegate = _delegate;
    }
    
    return self;
}

- (void)request
{
    [self retain];
    
    NSMutableURLRequest *request = [self requestSetup];
    responseData = [[NSMutableData data] retain];
    
    [HttpRequest setNetworkActivityIndicatorVisible:YES];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (NSData *)syncRequest
{
    NSMutableURLRequest *request = [self requestSetup];
    NSURLResponse *response;
    NSError *error;
    
    [HttpRequest setNetworkActivityIndicatorVisible:YES];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    [HttpRequest setNetworkActivityIndicatorVisible:NO];
    
    return returnData;
}

- (NSMutableURLRequest *)requestSetup
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *bodyData;
    BOOL first = YES;
    
    switch (type)
    {
        case GET:
            [request setHTTPMethod:@"GET"];
            break;
        case POST:
            [request setHTTPMethod:@"POST"];
            break;
        case PUT:
            [request setHTTPMethod:@"PUT"];
            break;
        case DELETE:
            [request setHTTPMethod:@"DELETE"];
            break;
            
        default:
            break;
    }
    
    for(NSString *key in dictionary)
    {
        NSString *value = [dictionary valueForKey:key];
        
        if (first)
        {
            bodyData = [NSString stringWithFormat:@"%@=%@", key, value];
            first = NO;
        }
        else
            bodyData = [bodyData stringByAppendingString:[NSString stringWithFormat:@"&%@=%@", key, value]];
    }
    [request setHTTPBody:[bodyData dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES]];
    
    return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [LeevaRequest requestReturn:self.delegate result:[NSString stringWithFormat:@"Connection failed: %@", [error description]] fromRequest:self.dictionary];
    
    [HttpRequest setNetworkActivityIndicatorVisible:NO];
    
    [self release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	[connection release];
    
    [HttpRequest setNetworkActivityIndicatorVisible:NO];
    
    [LeevaRequest requestReturn:self.delegate result:responseData fromRequest:self.dictionary];
    
	[responseData release];
    
    [self release];
}

#pragma mark - UIWindow Network Activity Indicator

//SOURCE: http://oleb.net/blog/2009/09/managing-the-network-activity-indicator/
+ (void)setNetworkActivityIndicatorVisible:(BOOL)setVisible
{
    static NSInteger NumberOfCallsToSetVisible = 0;
    
    if (setVisible)
        NumberOfCallsToSetVisible++;
    else 
        NumberOfCallsToSetVisible--;
    
    // The assertion helps to find programmer errors in activity indicator management.
    // Since a negative NumberOfCallsToSetVisible is not a fatal error, 
    // it should probably be removed from production code.
    NSAssert(NumberOfCallsToSetVisible >= 0, @"Network Activity Indicator was asked to hide more often than shown");
    
    // Display the indicator as long as our static counter is > 0.
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:(NumberOfCallsToSetVisible > 0)];
}

@end
