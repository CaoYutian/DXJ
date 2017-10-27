//
//  AnimationVC.m
//  DXJ
//
//  Created by Sunshine on 2017/10/26.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "AnimationVC.h"
#import "CardView.h"
#import "CardViewConstants.h"


@interface AnimationVC ()
@property (nonatomic, strong) CardView *cardView;


@end


@implementation AnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"卡片动画";
    
    [self SetUpUI];
}

- (void)SetUpUI{
    
    [CardView addCardViewWithSuperView:self.view];

}


@end
