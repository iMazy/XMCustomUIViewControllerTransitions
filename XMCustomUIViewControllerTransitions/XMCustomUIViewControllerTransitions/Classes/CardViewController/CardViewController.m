//
//  CardViewController.m
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import "CardViewController.h"
#import "BeautyCard.h"

@interface CardViewController ()
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

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
}

- (void)tapAction {

}

@end
