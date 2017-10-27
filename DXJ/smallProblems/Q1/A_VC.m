//
//  A_VC.m
//  DXJ
//
//  Created by Sunshine on 2017/10/26.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "A_VC.h"
#import "B_VC.h"
#import "C_VC.h"

@interface A_VC ()

@end

@implementation A_VC

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
//    1、A push B
//    [self.navigationController pushViewController:[B_VC new] animated:YES];
//    2、A present C
    [self presentViewController:[C_VC new] animated:YES completion:nil];
}

@end
