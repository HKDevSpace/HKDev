//
//  HKEntryListDefine.h
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#ifndef HKEntryListDefine_h
#define HKEntryListDefine_h

typedef NS_ENUM(NSInteger, HKEntryType) {
    
    HKEntryTypeLiveShow,  // 直播
    HKEntryTypeVOD,       // 传统播放 （video on demand）
    HKEntryTypeChat,      // 聊天
    
    HKEntryTypeBanner,         // 轮播
    HKEntryTypePhotoPicker,    // 相册选择器
    HKEntryTypeInputTextView,  // 输入框
    
    HKEntryTypeNSFoundation,   // <Foundataion> 框架
    HKEntryTypeUIKit,          // <UIKit> 框架
    HKEntryTypeAVFoundation,   // <AVFoundation> 框架
    HKEntryTypeThirdLibrary,   // 第三方库
};



#endif /* HKEntryListDefine_h */
