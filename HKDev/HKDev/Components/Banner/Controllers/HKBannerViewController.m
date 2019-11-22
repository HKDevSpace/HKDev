//
//  HKBannerViewController.m
//  HKDev
//
//  Created by HK on 2019/5/7.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKBannerViewController.h"
#import "HKBannerView.h"
#import "HKTestNibView.h"
#import <Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIResponder+HKExtension.h>


static NSString *const kTitle = @"kTitle";
static NSString *const kDesc = @"kDesc";
static NSString *const kImageURL = @"kImageURL";

static NSString *const BannerViewReuseID = @"BannerViewReuseID";


@interface HKBannerViewController () <HKBannerViewDataSource>

@property (strong, nonatomic) HKBannerView *normalBannerView;

@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation HKBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Banners";
    
    [self testNibView];

    [self setupBannerView];
    
    [self.normalBannerView reloadData];
}

- (void)routeEventWithName:(NSString *)eventName userInfo:(id)userInfo
{
    if ([eventName isEqualToString:FollowEvent]) {
        // Do something 
    }
    
    [self.nextResponder routeEventWithName:eventName userInfo:userInfo];
}


#pragma mark - <HKBannerViewDataSource>
- (NSInteger)numberOfItemsInBannerView:(HKBannerView *)bannerView
{
    return self.dataSource.count;
}

- (UIView *)bannerView:(HKBannerView *)bannerView viewForItemAtIndex:(NSInteger)index
{
    NSDictionary *item = [self.dataSource objectAtIndex:index];
    HKTestNibView *view = (HKTestNibView *)[bannerView dequeueReusableViewWithIdentifier:BannerViewReuseID];
    view.titleLabel.text = item[kTitle];
    view.descLabel.text = item[kDesc];
    [view.backgroudImageView sd_setImageWithURL:[NSURL URLWithString:item[kImageURL]]];
    
    return view;
}



#pragma mark - Private

- (void)setupBannerView
{
    [self.view addSubview:self.normalBannerView];
    [self.normalBannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.top.equalTo(self.view).with.offset(100);
        make.height.equalTo(@200.f);
    }];
    
    UINib *testViewNib = [UINib nibWithNibName:@"HKTestNibView" bundle:nil];
    [self.normalBannerView registerNib:testViewNib forViewReuseIdentifier:BannerViewReuseID];
}

- (void)testNibView
{
    UINib *testViewNib = [UINib nibWithNibName:@"HKTestNibView" bundle:nil];
    HKTestNibView *testView = [[testViewNib instantiateWithOwner:nil options:nil] firstObject];
    testView.titleLabel.text = @"This is a view of nib";
    [self.view addSubview:testView];
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.bottom.equalTo(self).with.offset(-30);
        make.height.equalTo(@200.f);
    }];
}


#pragma mark - Getter
- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = @[ @{kTitle : @"The Light Of Future",
                           kDesc : @"",
                           kImageURL : @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1696010414,3387340405&fm=26&gp=0.jpg" },
                         
                         @{kTitle : @"The Cube Of Power",
                           kDesc : @"Before time began, there was the Cube",
                           kImageURL : @"https://i.ytimg.com/vi/JZzegPW0lm8/maxresdefault.jpg" },
                         
                         @{kTitle : @"Space Ship In The Future",
                           kDesc : @"",
                           kImageURL : @"https://wallup.net/wp-content/uploads/2018/10/04/144152-s-f-future-spaceship-planet-city-748x468.jpg" },
                         
                         @{kTitle : @"City In The Future",
                           kDesc : @"Wisdom city, wisdom life",
                           kImageURL : @"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiaU3XqpZ4Pi_dwXbsl1Snt2yVlUEl2tQEnjifqj0xCsN4jfT1" },
                         ];
    }
    return _dataSource;
}

- (HKBannerView *)normalBannerView
{
    if (!_normalBannerView) {
        _normalBannerView = [[HKBannerView alloc] init];
        _normalBannerView.dataSource = self;
    }
    return _normalBannerView;
}



@end
