//
//  FlipDismissAnimationController.h
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 模态消失控制类
 */
@interface FlipDismissAnimationController : NSObject <UIViewControllerAnimatedTransitioning>
/** 目标视图大小 */
@property(nonatomic,assign)CGRect destinationFrame;

@end
