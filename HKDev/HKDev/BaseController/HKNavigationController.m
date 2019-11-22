//
//  HKNavigationController.m
//  HKScreenRotateDev
//
//  Created by HK on 2019/3/14.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKNavigationController.h"

#import <YYKit/UIColor+YYAdd.h>
#import <Masonry.h>

@interface HKNavigationController () <UINavigationControllerDelegate>

@property (strong, nonatomic) UIView *navigationSeparatorLine;

@end

@implementation HKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    
    // 该属性决定了navigationBar是否半透明
    // 默认为YES，当该属性为YES的时候，self.view 和 navigationController顶部对齐，即顶部与屏幕顶部对齐
    // 如果设置为NO, 那么 self.view 和 navigationBar 底部对齐
    self.navigationBar.translucent = YES;
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    /** NavigationBar background color
    self.navigationBar.barTintColor = [UIColor clearColor];
    self.navigationBar.tintColor = [UIColor purpleColor];
    self.navigationBar.backgroundColor = [UIColor blueColor];
     */


    /** 通过设置backgroundImage使 navigationBar 透明 */
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
    // 设置系统返回按钮图片
    self.navigationBar.backIndicatorImage = [UIImage imageNamed:@"Back20#FFFFFF"];
    self.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"Back20#FFFFFF"];
    
    [self.navigationBar addSubview:self.navigationSeparatorLine];
    [self.navigationSeparatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.navigationBar).with.offset(12);
        make.right.equalTo(self.navigationBar).with.offset(-12);
        make.bottom.equalTo(self.navigationBar);
        make.height.equalTo(@0.5);
    }];
    
}



#pragma mark - Override
// hidesBottomBarWhenPushed setting
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        viewController.hidesBottomBarWhenPushed = NO;
    } else {
        if (self.viewControllers.count == 1) {
            viewController.hidesBottomBarWhenPushed = YES;
        }
    }
    [super pushViewController:viewController animated:animated];
}





#pragma mark - Getter
- (UIView *)navigationSeparatorLine
{
    if (!_navigationSeparatorLine) {
        _navigationSeparatorLine = [[UIView alloc] init];
        _navigationSeparatorLine.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    }
    return _navigationSeparatorLine;
}


#pragma mark - Transition

// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController
{
    return UIInterfaceOrientationPortrait;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    return nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        if ([fromVC conformsToProtocol:@protocol(UIViewControllerAnimatedTransitioning)]) {
            return (id <UIViewControllerAnimatedTransitioning> )fromVC;
        }
    } else if (operation == UINavigationControllerOperationPop) {
        if ([fromVC conformsToProtocol:@protocol(UIViewControllerAnimatedTransitioning)]) {
            return (id <UIViewControllerAnimatedTransitioning> )fromVC;
        }
    }

    return nil;
    
}


@end
