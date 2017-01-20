//
//  CardViewController.m
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import "CardViewController.h"
#import "BeautyCard.h"
#import "RevealViewController.h"

#import "FlipPresentAnimationController.h"
#import "FlipDismissAnimationController.h"

@interface CardViewController () <UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/**  */
@property(nonatomic,strong)FlipPresentAnimationController *flipPresentAnimationController;
@property(nonatomic,strong)FlipDismissAnimationController *flipDismissAnimationController;

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameLabel.text = self.beautyCard.desc;
    self.cardView.layer.cornerRadius = 25;
    self.cardView.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.cardView addGestureRecognizer:tap];
    
    self.flipPresentAnimationController = [[FlipPresentAnimationController alloc] init];

    self.flipDismissAnimationController = [[FlipDismissAnimationController alloc] init];
}

- (void)tapAction {
    RevealViewController *revealVC = [[RevealViewController alloc] init];
    revealVC.card = self.beautyCard;
    revealVC.transitioningDelegate = self;
    [self showViewController:revealVC sender:nil];
}

#pragma mark ----------UIViewControllerTransitioningDelegate----------
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.flipPresentAnimationController.originFrame = self.cardView.frame;
    return self.flipPresentAnimationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.flipDismissAnimationController.destinationFrame = self.cardView.frame;
    return self.flipDismissAnimationController;
}

@end
