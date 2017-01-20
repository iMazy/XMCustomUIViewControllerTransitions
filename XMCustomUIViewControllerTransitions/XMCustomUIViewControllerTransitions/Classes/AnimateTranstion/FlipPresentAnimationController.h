//
//  FlipPresentAnimationController.h
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlipPresentAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

/** 原始大小 */
@property(nonatomic,assign)CGRect originFrame;

@end
