//
//  HKTestListItem+FoundationFactory.m
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestListItem+Factory.h"

@implementation HKTestListItem (Factory)

+ (HKTestListItem * __nullable)testItemWithType:(HKTestType)type
{
    NSString *title;
    NSString *desc;
    NSString *iconName;
    switch (type) {
        case HKTestTypeNSObject: {
            title = @"NSObject";
            desc = @"Test For NSObject";
        } break;
        case HKTestTypeNSInvocation: {
            title = @"NSInvocation";
            desc = @"Test For NSInvocation";
        } break;
            
            
        case HKTestTypeUIView: {
            title = @"UIView";
            desc = @"Test For UIView";
        } break;
            
        case HKTestTypeReactiveObjC: {
            title = @"ReactiveObjC";
            desc = @"Test For ReactiveObjC";
        } break;
        case HKTestTypeMasonry: {
            title = @"Masonry";
            desc = @"Test For Masonry";
        } break;
        case HKTestTypeYYKit: {
            title = @"YYKit";
            desc = @"Test For YYKit";
            
        } break;
            
        default:
            break;
    }
    
    if (!title && !desc && !iconName) {
        return nil;
    } else {
        return [[HKTestListItem alloc] initWithType:type title:title desc:desc iconName:iconName];
    }
}

@end
