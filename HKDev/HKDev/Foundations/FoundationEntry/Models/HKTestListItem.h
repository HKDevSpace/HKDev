//
//  HKTestListItem.h
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HKTestListDefine.h"


NS_ASSUME_NONNULL_BEGIN

@interface HKTestListItem : NSObject

@property (nonatomic, readonly) HKTestType type;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *iconName;


- (instancetype)initWithType:(HKTestType)type
                       title:(NSString *)title
                        desc:(NSString *)desc
                    iconName:(NSString *)iconName;

@end

NS_ASSUME_NONNULL_END
