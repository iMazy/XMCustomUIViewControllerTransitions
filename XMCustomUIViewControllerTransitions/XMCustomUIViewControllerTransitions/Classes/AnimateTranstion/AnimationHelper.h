//
//  AnimationHelper.h
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimationHelper : NSObject

+ (CATransform3D)yRotation:(double)angle;

+ (void)perspectiveTransformForContainerView:(UIView *)containerView;

+ (UIImageView *)getImage:(UIView *)view;

@end
