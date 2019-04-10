//
//  HKTestListItem.m
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestListItem.h"

@implementation HKTestListItem

- (instancetype)initWithType:(HKTestType)type
                       title:(NSString *)title
                        desc:(NSString *)desc
                    iconName:(NSString *)iconName
{
    self = [super init];
    if (self) {
        _type = type;
        _title = title;
        _desc = desc;
        _iconName = iconName;
    }
    
    return self;
}

@end
