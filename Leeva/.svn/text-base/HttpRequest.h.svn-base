//
//  HttpRequest.h
//  Leeva
//
//  Created by Adelino Faria on 3/21/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    GET,
    POST,
    PUT,
    DELETE
} HttpConnectionType;


@interface HttpRequest : NSObject {
    id delegate;
    NSURL *url;
    HttpConnectionType type;
    NSDictionary *dictionary;
    NSMutableData *responseData;
}

@property(nonatomic,retain)id delegate;
@property(nonatomic, retain)NSURL *url;
@property(nonatomic)HttpConnectionType type;
@property(nonatomic,retain)NSDictionary *dictionary;

- (HttpRequest *)initWithURL:(NSURL *)_url requestType:(HttpConnectionType)_type dictionary:(NSDictionary *)_dictionary delegate:(id)_delegate;

- (void)request;
- (NSData *)syncRequest;
- (NSMutableURLRequest *)requestSetup;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

+ (void)setNetworkActivityIndicatorVisible:(BOOL)setVisible;

@end
