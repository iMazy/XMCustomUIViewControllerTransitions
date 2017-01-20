//
//  RevealViewController.m
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import "RevealViewController.h"
#import "BeautyCard.h"

@interface RevealViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;

@end

@implementation RevealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameLabel.text = self.card.name;
    self.pictureView.image = [UIImage imageNamed:self.card.image];
}

- (IBAction)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
