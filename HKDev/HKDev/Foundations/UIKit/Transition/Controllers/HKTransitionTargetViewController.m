//
//  HKTransitionTargetViewController.m
//  HKDev
//
//  Created by HK on 2019/4/28.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTransitionTargetViewController.h"

#import <Masonry.h>

@interface HKTransitionTargetViewController ()  <UIViewControllerAnimatedTransitioning>

@property (strong, nonatomic) UIImageView *imageView;

@end


@implementation HKTransitionTargetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"To VC";
    

    [self.view addSubview:self.imageView];
//    self.imageView.frame = [UIScreen mainScreen].bounds;
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}



- (void)setBeginImage:(UIImage *)beginImage
{
    _beginImage = beginImage;
    
    self.imageView.image = beginImage;
}


- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}


#pragma mark - <UIViewControllerAnimatedTransitioning>
// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //   UITransitionContextToViewControllerKey
    //   UITransitionContextFromViewControllerKey
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
   
//    CGRect initialFrame = [transitionContext initialFrameForViewController:toVC];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromVC];
    
    
    [transitionContext.containerView addSubview:toView];
    [transitionContext.containerView bringSubviewToFront:fromView];
//    [transitionContext.containerView addSubview:fromView];
    

    fromView.center = CGPointMake(CGRectGetWidth(finalFrame)/2, CGRectGetHeight(finalFrame)/2);
    fromView.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:[self transitionDuration:nil] animations:^{

        CGRect endFrame = [self endFrame];
        CGFloat scaleX = endFrame.size.width / initialFrame.size.width;
        CGFloat scaleY = endFrame.size.height / initialFrame.size.height;
        CGAffineTransform transform = CGAffineTransformMakeScale(scaleX, scaleY);
        CGPoint toCenter = CGPointMake(CGRectGetMinX(endFrame)+CGRectGetWidth(endFrame)/2, CGRectGetMinY(endFrame) + CGRectGetHeight(endFrame)/2);
        
        fromView.transform = transform;
        fromView.center = toCenter;

    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:(![transitionContext transitionWasCancelled])];
        
    }];
}

- (void)dealloc
{
    
}

@end
