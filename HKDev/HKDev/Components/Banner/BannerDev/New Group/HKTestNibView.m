//
//  HKTestNibView.m
//  HKDev
//
//  Created by HK on 2019/5/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestNibView.h"
#import <UIResponder+HKExtension.h>

NSString *const FollowEvent  = @"FollowEvent";

@implementation HKTestNibView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)buttonClick
{
    [self routeEventWithName:FollowEvent userInfo:nil];
}

@end
