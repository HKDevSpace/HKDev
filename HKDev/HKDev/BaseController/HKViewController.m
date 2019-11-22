//
//  HKViewController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/14.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKViewController.h"
#import "UIDevice+HKExtension.h"
#import "HKDebugger.h"

#import <Masonry.h>




//域名转IP
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netdb.h>
//获取IP
#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <dlfcn.h>
#import <SystemConfiguration/SystemConfiguration.h>

#include <resolv.h>
#include <dns.h>


@interface HKViewController ()


@end

@implementation HKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set Background
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupBackgroudImage];

    // hide backButtonTitle
    [self hideNavigationBackButtonTitle];
    
    [self settingRightItem];
    
    NSLog(@"💛 ");
    
    printf("\(ESCAPE)fg255,0,0;\(object)\(RESET)");

}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotif" object:nil];
    
    NSURL *url = [NSURL URLWithString:@"https://yy1.tv.cmvideo.cn:8443/migutv-clt/pomsimage/1502/622/214/201904111041_1_HSJ1080H.jpg"];
    
    NSString *host = url.host;
    
    NSString *ip = [[self class] queryIpWithDomain:host];
    NSString *dns = [self  getDNSAddressesStr];
    
    NSLog(@"\e[1;31mRed text here\e[m normal text here");
    
    NSLog(@"DNS: [%@], IP : [%@]", dns, ip);
}


+ (NSString *)queryIpWithDomain:(NSString *)domain
{
    struct hostent *hs;
    struct sockaddr_in server;
    if ((hs = gethostbyname([domain UTF8String])) != NULL)
    {
        server.sin_addr = *((struct in_addr*)hs->h_addr_list[0]);
        return [NSString stringWithUTF8String:inet_ntoa(server.sin_addr)];
    }
    return nil;
 
}

/// 获取本机DNS服务器
- (NSString *) getDNSAddressesStr
{
    NSMutableString *addressStr = [[NSMutableString alloc]initWithString:@"DNS Addresses \n"];
    
    res_state res = malloc(sizeof(struct __res_state));
    
    int result = res_ninit(res);
    
    if ( result == 0 )
    {
        for ( int i = 0; i < res->nscount; i++ )
        {
            NSString *s = [NSString stringWithUTF8String :  inet_ntoa(res->nsaddr_list[i].sin_addr)];
            [addressStr appendFormat:@"%@\n",s];
            NSLog(@"%@",s);
        }
    }
    else
        [addressStr appendString:@" res_init result != 0"];
    
    return addressStr;
}

#pragma mark - Public
- (CGFloat)navigationBarHeight
{
    if (self.navigationController.navigationBarHidden) {
        return 0.F;
    } else {
        if ([UIDevice isNotchScreen]) {
            return 88.f;  // 44.f + 44.f
        } else {
            return 64.f;  // 20.f + 44.f
        }
    }
    
}

#pragma mark - Action
- (void)showDebugger
{
    [HKDebugger show];
}



#pragma mark - Private
// 隐藏返回按钮标题
- (void)hideNavigationBackButtonTitle
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
}

// 设置导航栏右按钮 - Debugger
- (void)settingRightItem
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ConsoleEntry"] style:UIBarButtonItemStylePlain target:self action:@selector(showDebugger)];
    if (self.navigationController) {
        self.navigationItem.rightBarButtonItem = item;
    }
}

// 设置背景图片
- (void)setupBackgroudImage
{
    UIImage *image = [UIImage imageNamed:@"GrayBlueBackground"];
    [self setupBackgroundImageViewWithImage:image];
}

- (void)setupBackgroundImageViewWithImage:(UIImage *)image
{
    if (!self.backgourdImageView) {
        _backgourdImageView = [[UIImageView alloc] init];
        self.backgourdImageView.contentMode = UIViewContentModeScaleToFill;
        [self.view insertSubview:self.backgourdImageView atIndex:0];
        [self.backgourdImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    
    self.backgourdImageView.image = image;
}


//#pragma mark - Override
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
//
//#pragma mark - Autorotate
//- (BOOL)shouldAutorotate
//{
//    return YES;
//}
//
//// 默认只支持竖屏
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait;
//}
//
//// 默认为竖屏显示
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return UIInterfaceOrientationPortrait;
//}

@end
