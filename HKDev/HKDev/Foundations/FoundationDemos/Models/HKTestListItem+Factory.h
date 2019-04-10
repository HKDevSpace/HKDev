//
//  HKTestListItem+FoundationFactory.h
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestListItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface HKTestListItem (Factory)

+ (HKTestListItem * __nullable)testItemWithType:(HKTestType)type;

@end

NS_ASSUME_NONNULL_END
