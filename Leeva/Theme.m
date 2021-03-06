//
//  Theme.m
//  Leeva
//
//  Created by Adelino Faria on 3/29/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "Theme.h"
#import "LeevaRequest.h"


@implementation Theme

@synthesize ID;
@synthesize templat;
@synthesize themeName;
@synthesize productName;
@synthesize logoData;
@synthesize logoType;
@synthesize logoSize;
@synthesize logoFileName;
@synthesize themeSettings;
@synthesize arrayThemeSettings;

- (Theme *)initThemeWithJson:(NSDictionary *)json
{
    if ((self = [super init]))
    {
        self.ID = [json valueForKey:@"ThemeID"];
        self.templat = [json valueForKey:@"Template"];
        self.themeName = [json valueForKey:@"ThemeName"];
        self.productName = [json valueForKey:@"ProductName"];
        self.logoData = [json valueForKey:@"LogoData"];
        self.logoType = [json valueForKey:@"LogoType"];
        self.logoSize = [json valueForKey:@"LogoSize"];
        self.logoFileName = [json valueForKey:@"LogoFileName"];
        self.themeSettings = [json valueForKey:@"ThemeSettings"];
        self.arrayThemeSettings = [json valueForKey:@"ArrayThemeSettings"];
    }
    return self;
}

+ (void)getThemes:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Themes.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

+ (void)getTheme:(NSString *)themeID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Theme.Get", @"Command",
                                @"JSON", @"ResponseFormat",
                                sessionID, @"SessionID",
                                themeID, @"ThemeID", nil];
    
    [LeevaRequest sendRequest:dictionary delegate:delegate];
}

@end
