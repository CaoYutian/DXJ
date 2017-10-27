//
//  SearchVC.h
//  DXJ
//
//  Created by Sunshine on 2017/9/27.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchVC : UIViewController

/** 搜索栏 */
@property (nonatomic, weak) UISearchBar *searchBar;

@property (nonatomic, strong) NSArray *tagsArray;

/** 推荐商品 */
@property (nonatomic, strong) NSString *recommendGoods;


@end
