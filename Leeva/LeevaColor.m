//
//  LeevaColor.m
//  Leeva
//
//  Created by Adelino Faria on 5/26/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import "LeevaColor.h"


@implementation UIColor (LeevaColor)

+ (UIColor *)leevaBaseColor {
    return [UIColor colorWithRed:0xf2/255.0 green:0xf6/255.0 blue:0xeb/255.0 alpha:0.3];
}

+ (UIColor *)leevaRegisterColor {
    return [UIColor colorWithRed:0x1b/255.0 green:0x42/255.0 blue:0x45/255.0 alpha:1.0];
}

+ (UIColor *)leevaClickColor {
    return [UIColor colorWithRed:0x00/255.0 green:0x68/255.0 blue:0x38/255.0 alpha:1.0];
}

+ (UIColor *)leevaRemenberColor {
    return [UIColor colorWithRed:0x77/255.0 green:0xc6/255.0 blue:0x0a/255.0 alpha:1.0];
}

+ (UIColor *)leevaBarBackgroundColor {
    return [UIColor colorWithRed:0x77/255.0 green:0xc6/255.0 blue:0x0a/255.0 alpha:0.7];
}

+ (UIColor *)leevaDetailBarBackgroundColor {
    return [UIColor colorWithRed:0xef/255.0 green:0xf4/255.0 blue:0xe7/255.0 alpha:1.0];
}

+ (UIColor *)leevaElementBackgroundColor {
    return [UIColor colorWithRed:0xef/255.0 green:0xf4/255.0 blue:0xe7/255.0 alpha:0.85];
}

+ (UIColor *)leevaElementSelectedColor {
    return [UIColor colorWithRed:0x8d/255.0 green:0xc6/255.0 blue:0x40/255.0 alpha:1.0];
}

+ (UIColor *)leevaElementBorderColor {
    return [UIColor colorWithRed:0xbb/255.0 green:0xbb/255.0 blue:0xbb/255.0 alpha:1.0];
}

+ (UIColor *)leevaValueColor1 {
    return [UIColor colorWithRed:0x4c/255.0 green:0x4b/255.0 blue:0x4c/255.0 alpha:1.0];
}

+ (UIColor *)leevaValueColor2 {
    return [UIColor colorWithRed:0x00/255.0 green:0x68/255.0 blue:0x38/255.0 alpha:1.0];
}

+ (UIColor *)leevaValueColor3 {
    return [UIColor colorWithRed:0x1c/255.0 green:0x42/255.0 blue:0x44/255.0 alpha:1.0];
}

+ (UIColor *)leevaValueColor4 {
    return [UIColor colorWithRed:0x67/255.0 green:0x68/255.0 blue:0x6b/255.0 alpha:1.0];
}

+ (UIColor *)leevaButtonColor {
    return [UIColor colorWithRed:0x01/255.0 green:0x68/255.0 blue:0x37/255.0 alpha:1.0];
}

+ (UIColor *)leevaTextBoxColor {
    return [UIColor colorWithRed:0x00/255.0 green:0x68/255.0 blue:0x38/255.0 alpha:1.0];
}

+ (UIColor *)leevaPlaceholderColor {
    return [UIColor colorWithRed:0xc0/255.0 green:0xd4/255.0 blue:0xa4/255.0 alpha:1.0];
}

+ (UIColor *)leevaComboBoxSelectionColor {
    return [UIColor colorWithWhite:0.75 alpha:0.4];
}

+ (UIColor *)leevaComboBoxBackgroundColor {
    return [UIColor colorWithRed:0xef/255.0 green:0xf4/255.0 blue:0xe7/255.0 alpha:1.0];
}

+ (UIColor *)leevaComboBoxArrowColor {
    return [UIColor colorWithRed:0x04/255.0 green:0x55/255.0 blue:0x33/255.0 alpha:1.0];
}

+ (UIColor *)leevaNoResultsColor {
    return [UIColor colorWithRed:0xd0/255.0 green:0xd2/255.0 blue:0xcd/255.0 alpha:1.0];
}

@end
