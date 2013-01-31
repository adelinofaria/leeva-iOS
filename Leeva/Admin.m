//
//  Admin.m
//  Leeva
//
//  Created by Adelino Faria on 3/22/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "Admin.h"


@implementation Admin

- (Admin *)initAdminWithJson:(NSDictionary *)json
{
    if ((self = [super init]))
    {
        self.ID = [json valueForKey:@"AdminID"];
        self.name = [json valueForKey:@"Name"];
        self.emailAddress = [json valueForKey:@"EmailAddress"];
        self.username = [json valueForKey:@"Username"];
        self.password = [json valueForKey:@"Password"];
    }
    return self;
}

@end
