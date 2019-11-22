//
//  HKTransitionListManager.h
//  HKDev
//
//  Created by HK on 2019/4/28.
//  Copyright © 2019 HK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^TLRequestSuccess) (NSArray *list);
typedef void (^TLRequestFailure) (NSInteger errorCode, NSString *errorMessage);


@interface HKTransitionListManager : NSObject




- (void)refreshDataSuccess:(TLRequestSuccess)success
                   failure:(TLRequestFailure)failure;

- (void)loadMoreDataSuccess:(TLRequestSuccess)success
                    failure:(TLRequestFailure)failure;

@end

NS_ASSUME_NONNULL_END
