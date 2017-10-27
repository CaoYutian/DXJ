//
//  C_VC.m
//  DXJ
//
//  Created by Sunshine on 2017/10/26.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "C_VC.h"

@interface C_VC ()

@end

@implementation C_VC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"%@ == %s", NSStringFromClass([self class]), __func__);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"%@ == %s", NSStringFromClass([self class]), __func__);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"%@ == %s", NSStringFromClass([self class]), __func__);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"%@ == %s", NSStringFromClass([self class]), __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
