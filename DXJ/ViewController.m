//
//  ViewController.m
//  DXJ
//
//  Created by Sunshine on 2017/9/26.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "ViewController.h"
#import "SearchVC.h"

#import "ScoringVC.h"
#import "HomepageVC.h"
#import "DrawrectVC.h"
#import "TypefaceVC.h"
#import "AnimationVC.h"
#import "smallProblemsVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    [btn setTitle:@"搜索" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(searcAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 220, 100, 100)];
    [btn2 setTitle:@"去评分" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(scoringAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 340, 100, 100)];
    [btn3 setTitle:@"首页" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor greenColor];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(goToHomePage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(50, 460, 100, 100)];
    [btn4 setTitle:@"画图" forState:UIControlStateNormal];
    btn4.backgroundColor = [UIColor greenColor];
    [btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(drawrectAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn4];
    
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    [btn5 setTitle:@"各种字体" forState:UIControlStateNormal];
    btn5.backgroundColor = [UIColor greenColor];
    [btn5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(typefaceAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc] initWithFrame:CGRectMake(200, 220, 100, 100)];
    [btn6 setTitle:@"卡片动画" forState:UIControlStateNormal];
    btn6.backgroundColor = [UIColor greenColor];
    [btn6 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(animationAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn6];
    
    UIButton *btn7 = [[UIButton alloc] initWithFrame:CGRectMake(200, 220, 100, 100)];
    [btn7 setTitle:@"小问题" forState:UIControlStateNormal];
    btn7.backgroundColor = [UIColor greenColor];
    [btn7 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn7 addTarget:self action:@selector(samllProblem) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn7];
}

- (void)searcAction {
    SearchVC *search = [[SearchVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:search];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)scoringAction {
    [self presentViewController:[HomepageVC new] animated:YES completion:nil];
}
- (void)goToHomePage {
    HomepageVC *home = [[HomepageVC alloc] init];
    [self.navigationController pushViewController:home animated:YES];
}

- (void)drawrectAction {
    DrawrectVC *draw = [[DrawrectVC alloc] init];
    [self.navigationController pushViewController:draw animated:YES];
}

- (void)typefaceAction {
    [self.navigationController pushViewController:[TypefaceVC new] animated:YES];
}

- (void)animationAction {
    [self.navigationController pushViewController:[AnimationVC new] animated:YES];
}

- (void)samllProblem {
    [self.navigationController pushViewController:[smallProblemsVC new] animated:YES];
}

@end
