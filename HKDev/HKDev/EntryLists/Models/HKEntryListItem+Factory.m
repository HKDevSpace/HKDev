//
//  HKEntryListItem+Factory.m
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKEntryListItem+Factory.h"

@implementation HKEntryListItem (Factory)


+ (HKEntryListItem * __nullable)entryListItemWithType:(HKEntryType)type
{
    
    NSString *title = nil;
    NSString *desc = nil;
    NSString *iconName = nil;
    switch (type) {
            // ========= Modules =========
            case HKEntryTypeLiveShow: {  // 直播
                title = @"LiveShow";
                desc = @"Live show about";
            } break;
            case HKEntryTypeVOD: {       // 传统播放 （video on demand）
                title = @"VOD";
                desc = @"Video on demand";
            } break;
            case HKEntryTypeChat: {      // 聊天
                title = @"Chat";
                desc = @"Video on demand";
            } break;
            
            // ========= Components =========
            case HKEntryTypeBanner: {         // Banner
                title = @"Banner";
                desc = @"Common banner";
            } break;
            case HKEntryTypePhotoPicker: {
                title = @"PhotoPicker";
                desc = @"Photo and video picker";
            } break;
            case HKEntryTypeInputTextView: {  // 输入框
                title = @"InputTextView";
                desc = @"Input text view on bottom side";
            } break;
            
            // ========= Foundations =========
            
            case HKEntryTypeNSFoundation: {   // <Foundataion> 框架
                title = @"NS-Foundation";
                desc = @"Foundation Framework";
            } break;
            case HKEntryTypeUIKit: {          // <UIKit> 框架
                title = @"UIKit";
                desc = @"UIKit Framework";
            } break;
            case HKEntryTypeAVFoundation: {   // <AVFoundation> 框架
                title = @"AVFoundation";
                desc = @"AVFoundation Framework";
            } break;
            case HKEntryTypeThirdLibrary: {   // 第三方库
                title = @"Third Library";
                desc = @"Some Good Third Library";
            } break;
        default:
            break;
    }
    
    if (!title && !desc && !iconName) {
        return nil;
    } else {
        return [[HKEntryListItem alloc] initWithType:type title:title desc:desc iconName:iconName];
    }
    
}

@end
