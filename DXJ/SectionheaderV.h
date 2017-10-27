//
//  SectionheaderV.h
//  DXJ
//
//  Created by Sunshine on 2017/10/8.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionheaderV : UIView

- (instancetype)initWithFrame:(CGRect)frame titleInfo:(NSDictionary *)titleInfo;

@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *redline;
@property (nonatomic, strong) UIImageView *excellentGoodslistPic;
@property (nonatomic, strong) UILabel *sectionTitle;

@property (nonatomic, strong) UILabel *hourLb;
@property (nonatomic, strong) UILabel *spaceLb;
@property (nonatomic, strong) UILabel *minutesLb;
@property (nonatomic, strong) UILabel *title;

@end
