//
//  HKTestListDefine.h
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#ifndef HKTestListDefine_h
#define HKTestListDefine_h

typedef NS_ENUM(NSInteger, HKTestType) {
    
    // -------- <Foundation> Framework -------
    HKTestTypeNSObject,
    HKTestTypeNSInvocation,
    
    // -------- <UIKit> Framework -------
    HKTestTypeUIView,
    HKTestTypeUIColor,
    HKTestTypeTransition, // 转场
    
    // -------- <AVFoundation> Framework -----
    HKTestTypeAVPlayer,
    
    // -------- Third Library --------
    HKTestTypeReactiveObjC,   // ReactiveObjc 库
    HKTestTypeMasonry,        // Masonry 库
    HKTestTypeYYKit,          // YYKit 库
    
};

#endif /* HKTestListDefine_h */
