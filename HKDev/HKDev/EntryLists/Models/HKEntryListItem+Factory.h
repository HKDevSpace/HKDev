//
//  HKEntryListItem+Factory.h
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKEntryListItem.h"


@interface HKEntryListItem (Factory)

+ (HKEntryListItem * __nullable)entryListItemWithType:(HKEntryType)type;

@end
