//
//  ScoringVC.m
//  DXJ
//
//  Created by Sunshine on 2017/9/29.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "ScoringVC.h"
#import <StoreKit/StoreKit.h>

@interface ScoringVC ()<SKStoreProductViewControllerDelegate>

@end

@implementation ScoringVC

- (void)viewDidLoad {
    [super viewDidLoad];

    // 把要评分的 appId 放在这 -- 这里测试用 《爱菜铺》
    [self openAppWithIdentifier:@"1131185443"];
}

- (void)openAppWithIdentifier:(NSString *)appId {
    SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc] init];
    storeProductVC.delegate = self;
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:appId forKey:SKStoreProductParameterITunesItemIdentifier];
    [storeProductVC loadProductWithParameters:dict completionBlock:^(BOOL result, NSError *error) {
        if (result) {
            [self presentViewController:storeProductVC animated:YES completion:nil];
        }
    }];
    
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)storeProductVC {
    [storeProductVC dismissViewControllerAnimated:YES completion:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}


@end
