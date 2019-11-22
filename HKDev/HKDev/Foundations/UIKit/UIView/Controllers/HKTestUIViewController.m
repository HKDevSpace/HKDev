//
//  HKTestUIViewController.m
//  HKDev
//
//  Created by HK on 2019/4/15.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestUIViewController.h"

#import "UIColor+HKExtension.h"

#import <MediaPlayer/MediaPlayer.h>
#import <Masonry.h>

@interface HKTestUIViewController ()

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIButton *showVolumButton;

@end

@implementation HKTestUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"UIView";
    
    [self setupViews];
    
    [self testSystemVolum];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeChanged:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
    
}

- (void)volumeChanged:(NSNotification *)notification
{
    NSLog(@"%@", notification.userInfo[@"AVSystemController_AudioVolumeNotificationParameter"]);
}

- (void)delayAction:(BOOL)param
{
    NSLog(@"延时执行");
}

- (void)testWindow
{
//    UIWindow *statusBarWindow = (UIWindow *)[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"];
//    UIView *testView = [[UIView alloc] init];
//    testView.backgroundColor = [UIColor purpleColor];
//    [statusBarWindow addSubview:testView];
//    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(statusBarWindow);
//        make.height.equalTo(@20.f);
//    }];
//    return;
    
#warning {--------  test code ---------
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(delayAction:) object:@(YES)];
    
    [self performSelector:@selector(delayAction:) withObject:nil afterDelay:2.f];
    return;

#warning  --------  test code ---------}
    
    
    if (!self.window) {
        UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.backgroundColor = [UIColor purpleColor];
        window.windowLevel = UIWindowLevelStatusBar + 1;
        window.hidden = NO;
        
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor yellowColor];
        label.text = @"New Window";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        [window addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(window).with.insets(UIEdgeInsetsMake(2, 2, 2, 2));
        }];
        
        [[UIApplication sharedApplication].keyWindow addSubview:window];
        [window mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo([UIApplication sharedApplication].keyWindow);
            make.height.equalTo(@20.f);
        }];
        
        self.window = window;
    }
    
}

- (void)showVolumTip
{
    [self testWindow];
}

- (void)testSystemVolum
{

    MPVolumeView *volumView = [[MPVolumeView alloc] init];
    volumView.backgroundColor = [UIColor hk_colorWithHex:0xFAFAFA];
    [volumView setVolumeThumbImage:[UIImage new] forState:UIControlStateNormal];
    volumView.frame = CGRectZero; //CGRectMake(10, 100, self.view.frame.size.width - 20, 20);
    [self.view addSubview:volumView];
}

#pragma mark - Private
- (void)setupViews
{
    CGFloat showVolumButtonHeight = 40.f;
    [self.view addSubview:self.showVolumButton];
    [self.showVolumButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).with.offset(-50.f);
        make.left.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view).with.offset(-20);
        make.height.equalTo(@(showVolumButtonHeight));
    }];
    self.showVolumButton.layer.cornerRadius = showVolumButtonHeight / 2;
}


#pragma mark - Setter
- (UIButton *)showVolumButton
{
    if (!_showVolumButton) {
        _showVolumButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_showVolumButton setTitle:@"Show Volum" forState:UIControlStateNormal];
        _showVolumButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _showVolumButton.layer.borderWidth = 1.f;
        [_showVolumButton addTarget:self action:@selector(showVolumTip) forControlEvents:UIControlEventAllEvents];
    }
    
    return _showVolumButton;
}


#pragma mark - Rotate

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}




@end
