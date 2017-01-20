//
//  CardViewController.m
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import "CardViewController.h"
#import "BeautyCard.h"
#import "RevealViewController.h"
// 自定义模态跳转工具类
#import "FlipPresentAnimationController.h"
#import "FlipDismissAnimationController.h"
// 左划手势工具类
#import "SwipeInteractionController.h"

@interface CardViewController () <UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 定义工具类属性,防止提前释放 */
@property(nonatomic,strong)FlipPresentAnimationController *flipPresentAnimationController;
@property(nonatomic,strong)FlipDismissAnimationController *flipDismissAnimationController;
@property(nonatomic,strong)SwipeInteractionController *swipeInteractionController;

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameLabel.text = self.beautyCard.desc;
    self.cardView.layer.cornerRadius = 25;
    self.cardView.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.cardView addGestureRecognizer:tap];
    
    // 初始化工具类
    self.flipPresentAnimationController = [[FlipPresentAnimationController alloc] init];
    self.flipDismissAnimationController = [[FlipDismissAnimationController alloc] init];
    self.swipeInteractionController = [[SwipeInteractionController alloc] init];
}

/**
 点击跳转方法
 
 */
- (void)tapAction {
    RevealViewController *revealVC = [[RevealViewController alloc] init];
    revealVC.card = self.beautyCard;
#pragma mark --------------------关键代码
    // 设置模态跳转的代理方法
    revealVC.transitioningDelegate = self;
    // 设置需要手势的控制器
    [self.swipeInteractionController wireToViewController:revealVC];
#pragma mark --------------------关键代码
    [self showViewController:revealVC sender:nil];
}

#pragma mark ----------UIViewControllerTransitioningDelegate----------关键代码
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.flipPresentAnimationController.originFrame = self.cardView.frame;
    return self.flipPresentAnimationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.flipDismissAnimationController.destinationFrame = self.cardView.frame;
    return self.flipDismissAnimationController;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.swipeInteractionController.interactionInProgress ? self.swipeInteractionController : nil;
}

@end
