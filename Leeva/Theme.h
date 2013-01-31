//
//  Theme.h
//  Leeva
//
//  Created by Adelino Faria on 3/29/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeevaResult.h"


@interface Theme : NSObject {
    NSString *ID;
    NSString *templat;
    NSString *themeName;
    NSString *productName;
    NSString *logoData;
    NSString *logoType;
    NSString *logoSize;
    NSString *logoFileName;
    NSString *themeSettings;
    NSDictionary *arrayThemeSettings;
}

@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSString *templat;
@property (nonatomic, retain) NSString *themeName;
@property (nonatomic, retain) NSString *productName;
@property (nonatomic, retain) NSString *logoData;
@property (nonatomic, retain) NSString *logoType;
@property (nonatomic, retain) NSString *logoSize;
@property (nonatomic, retain) NSString *logoFileName;
@property (nonatomic, retain) NSString *themeSettings;
@property (nonatomic, retain) NSDictionary *arrayThemeSettings;

- (Theme *)initThemeWithJson:(NSDictionary *)json;

+ (void)getThemes:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;
+ (void)getTheme:(NSString *)themeID sessionID:(NSString *)sessionID delegate:(id<LeevaDelegate>)delegate;

@end
