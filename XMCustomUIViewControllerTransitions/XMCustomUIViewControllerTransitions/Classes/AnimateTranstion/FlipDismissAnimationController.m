//
//  FlipDismissAnimationController.m
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import "FlipDismissAnimationController.h"
#import "AnimationHelper.h"

@implementation FlipDismissAnimationController
/**
 模态呈现时间间隔
 
 @param transitionContext 转场上下文
 @return 返回时间间隔
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.6;
}

/**
 控制动画
 
 @param transitionContext 转场上下文
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 容器视图
    UIView *containerView = [transitionContext containerView];
    // 当前控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 目标控制器
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 最终大小
    CGRect finialFrame = self.destinationFrame;
    // 根控制器截屏(初始化之后的)
    UIImageView *snapshot = [AnimationHelper getImage:fromVC.view];
    // 切圆角
    snapshot.layer.cornerRadius = 25;
    snapshot.layer.masksToBounds = YES;
    
    // 添加到容器视图中
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshot];
    // 隐藏根控制器视图
    fromVC.view.hidden = YES;
    // 设置动画属性
    [AnimationHelper perspectiveTransformForContainerView:containerView];
    // 默认让目标视图的截图 Y 轴 旋转180度
    toVC.view.layer.transform = [AnimationHelper yRotation:-M_PI_2];
    // 获取时间间隔
    CGFloat duration = [self transitionDuration:transitionContext];
    // 1 定义 关键帧动画
    [UIView animateKeyframesWithDuration:duration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        // 2 添加关键帧动画1 - 设置根控制器截屏的大小为最终大小
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.33 animations:^{
            snapshot.frame = finialFrame;
        }];
        // 3 添加关键帧动画2 - 设置根控制器截屏旋转180度隐藏
        [UIView addKeyframeWithRelativeStartTime:0.33 relativeDuration:0.33 animations:^{
            snapshot.layer.transform = [AnimationHelper yRotation:M_PI_2];
        }];
        // 4 添加关键帧动画1 - 让目标控制器旋转 180 度 展示出来
        [UIView addKeyframeWithRelativeStartTime:0.66 relativeDuration:0.33 animations:^{
            toVC.view.layer.transform = [AnimationHelper yRotation:0.0];
        }];
    } completion:^(BOOL finished) {
        // 显示目标控制器
        fromVC.view.hidden = false;
        // 移除截屏
        [snapshot removeFromSuperview];
        // 完成 模态跳转动画
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
