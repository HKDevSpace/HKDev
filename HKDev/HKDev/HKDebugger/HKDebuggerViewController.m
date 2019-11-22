//
//  HKDebuggerViewController.m
//  HKDev
//
//  Created by HK on 2019/4/18.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKDebuggerViewController.h"

#import <HKCategories/UIResponder+HKExtension.h>

#import <Masonry.h>


@interface HKDebuggerViewController ()

@property (strong, nonatomic) UIButton *exitButton;

@end

@implementation HKDebuggerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    [self.view addSubview:visualView];
    [visualView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.view addSubview:self.exitButton];
    [self.exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo(@(50));
        make.width.equalTo(@(50));
    }];
}


- (void)exitAction
{
    if ([self.eventDelegate respondsToSelector:@selector(exitEvent:)]) {
        [self.eventDelegate exitEvent:self];
    }
}


- (UIButton *)exitButton
{
    if (!_exitButton) {
        _exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_exitButton setImage:[UIImage imageNamed:@"ConsoleHide"] forState:UIControlStateNormal];
        [_exitButton addTarget:self action:@selector(exitAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitButton;
}


@end
