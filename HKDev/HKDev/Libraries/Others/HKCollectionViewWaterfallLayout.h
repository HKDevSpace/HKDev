//
//  HKCollectionViewWaterfallLayout.h
//  HKDev
//
//  Created by HK on 2019/4/28.
//  Copyright © 2019 HK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HKCollectionViewWaterfallLayoutDelegate <NSObject>


@end





@interface HKCollectionViewWaterfallLayout : UICollectionViewLayout




/**
 * @Brief The number of column.
 * @Discussion The default value of this property is 2.
 */
@property (nonatomic) NSInteger columnCount;


/**
 * @Brief The minimum spacing to use between lines of items in the grid.
 * @Discussion The default value of this property is 10.0.
 */
@property (nonatomic) CGFloat minimumLineSpacing;

/**
 * @Brief The minimum spacing to use between items in the same row.
 * @Discussion The default value of this property is 10.0.
 */
@property (nonatomic) CGFloat minimumInteritemSpacing;


@end

NS_ASSUME_NONNULL_END
