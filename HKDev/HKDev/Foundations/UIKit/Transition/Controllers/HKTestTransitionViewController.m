//
//  HKTestTransitionViewController.m
//  HKDev
//
//  Created by HK on 2019/4/28.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestTransitionViewController.h"
#import "HKTransitionTargetViewController.h"

#import "UIDevice+HKExtension.h"
#import <Masonry.h>


@interface HKTestTransitionViewController () <UIViewControllerAnimatedTransitioning, UIViewControllerInteractiveTransitioning>

@property (strong, nonatomic) UIImageView *beginImageView;
@property (strong, nonatomic) UIImageView *endImageView;



@end

@implementation HKTestTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
    
//    self.transitioningDelegate = self;
    
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

    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];



    [transitionContext.containerView addSubview:toView];

    CGRect fromFrame = [self fromFrame];
    
    CGFloat scaleX = fromFrame.size.width / toViewFinalFrame.size.width;
    CGFloat scaleY = fromFrame.size.height / toViewFinalFrame.size.height;
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleX, scaleY);
    
    CGPoint originCenter = CGPointMake(CGRectGetMinX(fromFrame)+CGRectGetWidth(fromFrame)/2, CGRectGetMinY(fromFrame) + CGRectGetHeight(fromFrame)/2);
    
    toView.transform = transform;
    toView.center = originCenter;

    [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
        
        toView.transform = CGAffineTransformIdentity;
        toView.center = CGPointMake(CGRectGetWidth(toViewFinalFrame)/2, CGRectGetHeight(toViewFinalFrame)/2);

    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:(![transitionContext transitionWasCancelled])];
    }];
}



- (CGRect)fromFrame
{
    return self.beginImageView.frame;
}

- (CGRect)toFrame
{
    return [UIScreen mainScreen].bounds;
}



#pragma mark - <UIViewControllerInteractiveTransitioning>



#pragma mark - Action
- (void)showDetailAction
{
    
    HKTransitionTargetViewController *vc = [[HKTransitionTargetViewController alloc] init];
    vc.beginImage = self.beginImageView.image;
    vc.beginFrame = self.beginImageView.frame;
    vc.endImage = self.endImageView.image;
    vc.endFrame = self.endImageView.frame;
    
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark - Private
- (void)setupViews
{
    self.title = @"From VC";
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    [self.view addSubview:self.beginImageView];
    [self.view addSubview:self.endImageView];
    
    [self.beginImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(20.f);
        make.top.equalTo(self.view).with.offset([self navigationBarHeight] + 20.f);
        make.width.equalTo(@150.f);
        make.height.equalTo(@(150.f * screenSize.height / screenSize.width));
    }];
    
    [self.endImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-20.f);
        make.bottom.equalTo(self.view).with.offset(-20.f);
        make.width.equalTo(@150.f);
        make.height.equalTo(@(150.f * screenSize.height / screenSize.width));
    }];
}


#pragma mark - Getter
- (UIImageView *)beginImageView
{
    if (!_beginImageView) {
        _beginImageView = [[UIImageView alloc] init];
        _beginImageView.image = [UIImage imageNamed:@"gradient"];
        _beginImageView.clipsToBounds = YES;
        _beginImageView.userInteractionEnabled = YES;
        [_beginImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDetailAction)]];
    }
    return _beginImageView;
}

- (UIImageView *)endImageView
{
    if (!_endImageView) {
        _endImageView = [[UIImageView alloc] init];
        _endImageView.image = [UIImage imageNamed:@"stars"];
    }
    return _endImageView;
}

@end
