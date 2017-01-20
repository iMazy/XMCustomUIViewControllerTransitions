//
//  FlipPresentAnimationController.m
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import "FlipPresentAnimationController.h"
#import "AnimationHelper.h"

@implementation FlipPresentAnimationController

/**
 模态呈现时间间隔
 
 @param transitionContext 转场上下文
 @return 返回时间间隔
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

/**
 控制动画
 
 @param transitionContext 转场上下文
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 容器视图
    UIView *containerView = [transitionContext containerView];
    // 当前控制器
    UIViewController *fromVC = [transitionContext  viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 目标控制器
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 初始大小
    CGRect initialFrame = self.originFrame;
    // 最终大小
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    // 目标控制器截屏(初始化之后的)
    UIImageView *snapshot = [AnimationHelper getImage:toVC.view];
    // 设置目标控制器的初始大小
    snapshot.frame = initialFrame;
    // 切圆角
    snapshot.layer.cornerRadius = 25;
    snapshot.layer.masksToBounds = YES;
    // 添加到容器视图中
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshot];
    // 隐藏目标控制器视图
    toVC.view.hidden = YES;
    // 设置动画属性
    [AnimationHelper perspectiveTransformForContainerView:containerView];
    // 默认让目标视图的截图 Y 轴 旋转180度
    snapshot.layer.transform = [AnimationHelper yRotation:M_PI_2];
    // 获取时间间隔
    CGFloat duration = [self transitionDuration:transitionContext];
    // 1 定义 关键帧动画
    [UIView animateKeyframesWithDuration:duration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        // 2 添加关键帧动画1 - 让主控制器旋转 180 度
        snapshot.layer.transform = [AnimationHelper yRotation:M_PI_2];
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.33 animations:^{
            fromVC.view.layer.transform = [AnimationHelper yRotation:-M_PI_2];
        }];
        // 3 添加关键帧动画2 - 切换目标控制器的动画,让目标控制器截图旋转180度展示出来
        [UIView addKeyframeWithRelativeStartTime:0.33 relativeDuration:0.33 animations:^{
            snapshot.layer.transform = [AnimationHelper yRotation:0.0];
        }];
        // 4 添加关键帧动画3 - 设置目标控制器截屏的大小为最终屏幕
        [UIView addKeyframeWithRelativeStartTime:0.66 relativeDuration:0.33 animations:^{
            snapshot.frame = finalFrame;
        }];
        
    } completion:^(BOOL finished) {
        // 显示目标控制器
        toVC.view.hidden = NO;
        // 恢复根控制器的 transform 为初始状态
        fromVC.view.layer.transform = [AnimationHelper yRotation:0.0];
        // 移除截屏
        [snapshot removeFromSuperview];
        // 完成 模态跳转动画
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
