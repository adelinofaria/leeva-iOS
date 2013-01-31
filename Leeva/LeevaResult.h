//
//  LeevaResult.h
//  Leeva
//
//  Created by Adelino Faria on 3/21/11.
//  Copyright 2011 Bluekora - Agência Web & Comunicação, Lda. All rights reserved.
//

#import <Foundation/Foundation.h>


//  Leeva Delegate is designed to take the data to the rightfully
//  request owner
//
@protocol LeevaDelegate <NSObject>

- (void)leevaResult:(NSDictionary *)result fromRequest:(NSDictionary *)dictionary;

@end