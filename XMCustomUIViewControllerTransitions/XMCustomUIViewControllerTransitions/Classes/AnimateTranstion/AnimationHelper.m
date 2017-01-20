//
//  AnimationHelper.m
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import "AnimationHelper.h"

@implementation AnimationHelper

/**
 设置 y轴 旋转角度
 
 @param angle 旋转角度
 @return CATransform3D
 */
+ (CATransform3D)yRotation:(double)angle {
    return CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0);
}


/**
 设置 子视图的动画属性
 
 @param containerView 容器视图
 */
+ (void)perspectiveTransformForContainerView:(UIView *)containerView {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    containerView.layer.sublayerTransform = transform;
}

/**
 通过给定的视图获取当前视图的截屏图像
 
 @param view 需要截图的视图
 @return 返回 UIImageView
 */
+ (UIImageView *)getImage:(UIView *)view {
    // 宽/高度
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    // 开启图像上下文
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    // 获取当前上下文
    CGContextRef content = UIGraphicsGetCurrentContext();
    // 将上下文渲染到当前视图上
    [view.layer renderInContext:content];
    // 获取图像上下文的当前图像
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图像上下文
    UIGraphicsEndImageContext();
    // 返回 UIImageView
    return [[UIImageView alloc] initWithImage:image];
}

@end
