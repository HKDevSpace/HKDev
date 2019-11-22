//
//  NSObject+StringExtension.m
//  HKDev
//
//  Created by HK on 2019/4/16.
//  Copyright © 2019 HK. All rights reserved.
//

#import "NSObject+StringExtension.h"

@implementation NSObject (StringExtension)

- (BOOL)isEmptyString
{
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if ([(NSString *)self length] > 0) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)isEmptyAttributedString
{
    if (![self isKindOfClass:[NSAttributedString class]]) {
        return YES;
    }
    
    if ([(NSString *)self length] > 0) {
        return NO;
    } else {
        return YES;
    }
}

@end
