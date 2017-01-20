//
//  PageViewController.m
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import "PageViewController.h"
#import "BeautyCardStore.h"
#import "CardViewController.h"

@interface PageViewController ()<UIPageViewControllerDataSource>

@property(nonatomic,strong)NSArray *beautyCards;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 自己接受自己的数据源方法
    self.dataSource = self;
    // 加载数据
    self.beautyCards = [BeautyCardStore defaultBeauties];
    // 添加子控制器
    [self setViewControllers:@[[self viewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
}

// 通过下标创建子控制器
- (UIViewController *)viewControllerAtIndex:(int)index {
    CardViewController *cardVC = [[CardViewController alloc] init];
    cardVC.pageIndex = index;
    cardVC.beautyCard = self.beautyCards[index];
    return cardVC;
}

#pragma mark ----------UIPageViewControllerDataSource----------
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    CardViewController *cardVC = (CardViewController *)viewController;
    
    if (cardVC.pageIndex > 0) {
        return [self viewControllerAtIndex:cardVC.pageIndex -1];
    }
    return nil;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    CardViewController *cardVC = (CardViewController *)viewController;
    if (cardVC.pageIndex < self.beautyCards.count-1) {
        return [self viewControllerAtIndex:cardVC.pageIndex + 1];
    }
    return nil;
}

// 总共有多少个子控制器
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.beautyCards.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

@end
