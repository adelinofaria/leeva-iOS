//
//  Email.h
//  Leeva
//
//  Created by Adelino Faria on 3/29/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeevaResult.h"


@interface Email : NSObject {
    NSString *ID;
    NSString *relUserID;
    NSString *emailName;
    NSString *fromName;
    NSString *fromEmail;
    NSString *replyToName;
    NSString *replyToEmail;
    NSString *contentType;
    NSString *mode;
    NSString *fetchURL;
    NSString *fetchPlainURL;
    NSString *subject;
    NSString *plainContent;
    NSString *htmlContent;
    NSString *imageEmbedding;
    NSString *relTemplateID;
    NSString *attachments;
}

@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSString *relUserID;
@property (nonatomic, retain) NSString *emailName;
@property (nonatomic, retain) NSString *fromName;
@property (nonatomic, retain) NSString *fromEmail;
@property (nonatomic, retain) NSString *replyToName;
@property (nonatomic, retain) NSString *replyToEmail;
@property (nonatomic, retain) NSString *contentType;
@property (nonatomic, retain) NSString *mode;
@property (nonatomic, retain) NSString *fetchURL;
@property (nonatomic, retain) NSString *fetchPlainURL;
@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *plainContent;
@property (nonatomic, retain) NSString *htmlContent;
@property (nonatomic, retain) NSString *imageEmbedding;
@property (nonatomic, retain) NSString *relTemplateID;
@property (nonatomic, retain) NSString *attachments;

- (Email *)initEmailWithJson:(NSDictionary *)json;

+ (void)getEmails:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;
+ (void)getEmail:(NSString *)emailID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;

@end
