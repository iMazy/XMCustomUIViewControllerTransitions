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

/**  */
@property(nonatomic,strong)BeautyCard *beautyCard;
/**  */
@property(nonatomic,assign)int pageIndex;

@end
