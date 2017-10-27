//
//  homeTableViewCell.h
//  DXJ
//
//  Created by Sunshine on 2017/10/8.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *goodsPic;
@property (nonatomic, strong) UIButton *tagBtn;
@property (nonatomic, strong) UILabel *goodsTitle;
@property (nonatomic, strong) UILabel *goodsDetailTitle;
@property (nonatomic, strong) UIImageView *discountsPricePic;
@property (nonatomic, strong) UILabel *discountsPrice;
@property (nonatomic, strong) UIImageView *beatPic;
@property (nonatomic, strong) UILabel *beatNum;
@property (nonatomic, strong) UIView *line;

@end
