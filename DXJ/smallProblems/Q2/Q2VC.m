//
//  Q2VC.m
//  DXJ
//
//  Created by Sunshine on 2017/10/26.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "Q2VC.h"

@interface Q2VC ()

@end

@implementation Q2VC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self test];
}

- (void)test
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"=== A ===");
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"=== B ===");
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"=== C ===");
    });
    
    dispatch_group_t group = dispatch_group_create();
    
    //    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
    //        NSLog(@"=== 任务 D 完成 ===");
    //        NSLog(@"=== 任务 E 完成 ===");
    //        NSLog(@"=== 任务 F 完成 ===");
    //    });
    // 这里执行三次
    dispatch_queue_t aaa = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    dispatch_async(aaa,^{
        
        dispatch_group_leave(group);
        NSLog(@"=== 任务 D 完成 ===");
    });
    
    dispatch_queue_t bbb = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    dispatch_async(bbb,^{
        
        dispatch_group_leave(group);
        NSLog(@"=== 任务 E 完成 ===");
    });
    
    dispatch_queue_t ccc = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    dispatch_async(ccc,^{
        
        dispatch_group_leave(group);
        NSLog(@"=== 任务 F 完成 ===");
    });
    
    // 三次结束
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"=== 任务 M 完成 ===");
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
