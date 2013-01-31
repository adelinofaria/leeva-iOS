//
//  Email.m
//  Leeva
//
//  Created by Adelino Faria on 3/29/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "Email.h"
#import "LeevaRequest.h"


@implementation Email

@synthesize ID;
@synthesize relUserID;
@synthesize emailName;
@synthesize fromName;
@synthesize fromEmail;
@synthesize replyToName;
@synthesize replyToEmail;
@synthesize contentType;
@synthesize mode;
@synthesize fetchURL;
@synthesize fetchPlainURL;
@synthesize subject;
@synthesize plainContent;
@synthesize htmlContent;
@synthesize imageEmbedding;
@synthesize relTemplateID;
@synthesize attachments;

- (Email *)initEmailWithJson:(NSDictionary *)json
{
    if ((self = [super init]))
    {
        self.ID = [json valueForKey:@"EmailID"];
        self.relUserID = [json valueForKey:@"RelUserID"];
        self.emailName = [json valueForKey:@"EmailName"];
        self.fromName = [json valueForKey:@"FromName"];
        self.fromEmail = [json valueForKey:@"FromEmail"];
        self.replyToName = [json valueForKey:@"ReplyToName"];
        self.replyToEmail = [json valueForKey:@"ReplyToEmail"];
        self.contentType = [json valueForKey:@"ContentType"];
        self.mode = [json valueForKey:@"Mode"];
        self.fetchURL = [json valueForKey:@"FetchURL"];
        self.fetchPlainURL = [json valueForKey:@"FetchPlainURL"];
        self.subject = [json valueForKey:@"Subject"];
        self.plainContent = [json valueForKey:@"PlainContent"];
        self.htmlContent = [json valueForKey:@"HtmlContent"];
        self.imageEmbedding = [json valueForKey:@"ImageEmbedding"];
        self.relTemplateID = [json valueForKey:@"RelTemplateID"];
        self.attachments = [json valueForKey:@"Attachments"];
    }
    return self;
}

+ (void)getEmails:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Emails.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}
+ (void)getEmail:(NSString *)emailID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Email.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID",
                                emailID, @"EmailID", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

@end
