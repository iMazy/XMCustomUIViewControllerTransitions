//
//  SwipeInteractionController.h
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeInteractionController : UIPercentDrivenInteractiveTransition
/**  */
@property(nonatomic,assign)BOOL interactionInProgress;

- (void)wireToViewController:(UIViewController *)viewController;

@end
