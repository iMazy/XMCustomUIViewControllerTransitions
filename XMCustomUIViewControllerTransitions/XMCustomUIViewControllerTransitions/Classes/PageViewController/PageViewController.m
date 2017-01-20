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
    self.dataSource = self;
    
    self.beautyCards = [BeautyCardStore defaultBeauties];
    
    [self setViewControllers:@[[self viewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
}

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


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.beautyCards.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

@end
