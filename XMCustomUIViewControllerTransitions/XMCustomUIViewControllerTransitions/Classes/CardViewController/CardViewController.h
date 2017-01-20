//
//  CardViewController.h
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BeautyCard;

@interface CardViewController : UIViewController

/** 卡片模型 */
@property(nonatomic,strong)BeautyCard *beautyCard;
/** 当前页码 */
@property(nonatomic,assign)int pageIndex;

@end
