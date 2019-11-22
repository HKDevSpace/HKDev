//
//  HKBannerView.h
//  HKDev
//
//  Created by HK on 2019/5/7.
//  Copyright © 2019 HK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HKBannerView;

NS_ASSUME_NONNULL_BEGIN



@protocol HKBannerViewDataSource <NSObject>

- (NSInteger)numberOfItemsInBannerView:(HKBannerView *)bannerView;

- (UIView *)bannerView:(HKBannerView *)bannerView viewForItemAtIndex:(NSInteger)index;


@end

@protocol HKBannerViewDelegate <NSObject>

@end


@interface HKBannerView : UIView

@property (weak, nonatomic) id <HKBannerViewDataSource> dataSource;
@property (weak, nonatomic) id <HKBannerViewDelegate> delegate;
@property (nonatomic, getter=isLoopStyle) BOOL loopStyle;  // Default is YES.
@property (nonatomic) NSInteger currentIndex;


- (void)registerNib:(UINib *)nib forViewReuseIdentifier:(NSString *)identifier;
- (void)registerClass:(Class)cellClass forViewReuseIdentifier:(NSString *)identifier;
- (UIView *)dequeueReusableViewWithIdentifier:(NSString *)identifier;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
