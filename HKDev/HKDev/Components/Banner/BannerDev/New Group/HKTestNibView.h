//
//  HKTestNibView.h
//  HKDev
//
//  Created by HK on 2019/5/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


extern NSString *const FollowEvent;


@interface HKTestNibView : UIView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroudImageView;

@end

NS_ASSUME_NONNULL_END
