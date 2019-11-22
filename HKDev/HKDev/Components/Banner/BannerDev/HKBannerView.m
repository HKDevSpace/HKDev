//
//  HKBannerView.m
//  HKDev
//
//  Created by HK on 2019/5/7.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKBannerView.h"
#import <Masonry.h>


static NSString *const kReuseViews = @"kReuseViews";
static NSString *const kCreator = @"kRegister";



@interface HKBannerView () <UIScrollViewDelegate>

@property (strong, nonatomic) UIView *previousView;
@property (strong, nonatomic) UIView *currentView;
@property (strong, nonatomic) UIView *nextView;

@property (strong, nonatomic) UIScrollView *scrollView;

// {ReuseIdentifier : nib / className}
/**
 ReuseIdentifier : { }
 */


@property (strong, nonatomic) NSMutableDictionary *registViews;

@end



@implementation HKBannerView

#pragma mark - Initialization
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _loopStyle = YES;

        [self setupViews];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.frame), 0);
}


#pragma mark - Public
- (void)registerNib:(UINib *)nib forViewReuseIdentifier:(NSString *)identifier
{
    NSAssert(nib, @"nib can not be nil");
    NSAssert(identifier.length > 0, @"length of identifier must greater 0");
    [self.registViews setObject:nib forKey:identifier];
}

- (void)registerClass:(Class)cellClass forViewReuseIdentifier:(NSString *)identifier
{
    NSAssert(cellClass, @"nib can not be nil");
    NSAssert(identifier.length > 0, @"length of identifier must greater 0");
    [self.registViews setObject:cellClass forKey:identifier];
}

- (UIView *)dequeueReusableViewWithIdentifier:(NSString *)identifier
{
    return nil;
}

- (void)reloadData
{
    
}

#pragma mark - Action

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 禁止循环滚动应该在这里处理
    if (self.isLoopStyle) {
        self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.frame), 0);
    } else {
        
        
    }
    


}

#pragma mark - Private
- (void)setupViews
{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.scrollView];
    [self.scrollView addSubview:self.previousView];
    [self.scrollView addSubview:self.currentView];
    [self.scrollView addSubview:self.nextView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.previousView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView);
        make.top.bottom.equalTo(self.scrollView);
        make.width.height.equalTo(self);
    }];
    
    [self.currentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.previousView.mas_right);
        make.top.bottom.equalTo(self.scrollView);
        make.width.height.equalTo(self);
    }];
    
    [self.nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentView.mas_right);
        make.top.bottom.equalTo(self.scrollView);
        make.width.height.equalTo(self);
        make.right.equalTo(self.scrollView);
        
    }];
}

// 当数据或者设置发生变化是，重新处理views
- (void)resetViews
{
    
    
}

- (void)storeNib:(UINib *)nib forIdentifier:(NSString *)identifier
{
    
}

- (void)storeClass:(Class)class forIdentifier:(NSString *)identifier
{
    
}


#pragma mark - Setter

- (void)setLoopStyle:(BOOL)loopStyle
{
    _loopStyle = loopStyle;
}


#pragma mark - Getter
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIView *)previousView
{
    if (!_previousView) {
        _previousView = [[UIView alloc] init];
        _previousView.backgroundColor = [UIColor yellowColor];
    }
    return _previousView;
}

- (UIView *)currentView
{
    if (!_currentView) {
        _currentView = [[UIView alloc] init];
        _currentView.backgroundColor = [UIColor purpleColor];
    }
    return _currentView;
}

- (UIView *)nextView
{
    if (!_nextView) {
        _nextView = [[UIView alloc] init];
        _nextView.backgroundColor = [UIColor greenColor];
    }
    return _nextView;
}

- (NSMutableDictionary *)registViews
{
    if (!_registViews) {
        _registViews = [[NSMutableDictionary alloc] init];
    }
    return _registViews;
}


@end
