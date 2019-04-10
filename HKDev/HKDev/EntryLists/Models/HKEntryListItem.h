//
//  HKEntryListItem.h
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//
// 入口模型

#import <Foundation/Foundation.h>
#import "HKEntryListDefine.h"



@interface HKEntryListItem : NSObject

@property (nonatomic, readonly) HKEntryType type;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *iconName;


- (instancetype)initWithType:(HKEntryType)type
                       title:(NSString *)title
                        desc:(NSString *)desc
                    iconName:(NSString *)iconName;

@end
