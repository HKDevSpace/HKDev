//
//  HKCollectionViewWaterfallLayout.m
//  HKDev
//
//  Created by HK on 2019/4/28.
//  Copyright © 2019 HK. All rights reserved.
//


//CHTCollectionViewWaterfallLayout

#import "HKCollectionViewWaterfallLayout.h"

@interface HKCollectionViewWaterfallLayout ()

@property (weak, nonatomic) id <HKCollectionViewWaterfallLayoutDelegate> delegate;

@property (strong, nonatomic) NSMutableArray *columnHeights;

@end


@implementation HKCollectionViewWaterfallLayout


#pragma mark - Init
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _columnCount = 2;
    _minimumLineSpacing = 10.f;
    _minimumInteritemSpacing = 10.f;
}



- (void)prepareLayout
{
    [super prepareLayout];
    
    // 清空数据
    [self.columnHeights removeAllObjects];
    
    // 初始化布局数据
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    if (numberOfSections == 0) {
        return;
    }
    
    NSAssert([self.delegate conformsToProtocol:@protocol(HKCollectionViewWaterfallLayoutDelegate)], @"UICollectionView's delegate need conform to HKCollectionViewWaterfallLayoutDelegate protocol.");
    NSAssert(self.columnCount > 0, @"Column count must be greater 0.");
    
    for (NSInteger section = 0; section < numberOfSections; section++) {
        // MARK: Extension - number of columns at section.
        NSMutableArray *columnHeightsAtSection = [NSMutableArray arrayWithCapacity:self.columnCount];
        for (NSInteger columnIndex = 0; columnIndex < self.columnCount; columnIndex++) {
            [columnHeightsAtSection addObject:@0.f];
        }
        [self.columnHeights addObject:columnHeightsAtSection];
    }
    
    CGFloat top = 0.f;
    UICollectionViewLayoutAttributes *attributes;
    
    

    

    
}



#pragma mark - Getter
- (id <HKCollectionViewWaterfallLayoutDelegate>) delegate
{
    return (id<HKCollectionViewWaterfallLayoutDelegate>)(self.collectionView.delegate);
}

- (NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [[NSMutableArray alloc] init];
    }
    return _columnHeights;
}


@end
