//
//  HKEntryListItem.m
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKEntryListItem.h"

@interface HKEntryListItem()

@property (nonatomic, readwrite) HKEntryType type;

@end

@implementation HKEntryListItem

- (instancetype)initWithType:(HKEntryType)type title:(NSString *)title desc:(NSString *)desc iconName:(NSString *)iconName
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
