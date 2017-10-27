//
//  SectionheaderV.m
//  DXJ
//
//  Created by Sunshine on 2017/10/8.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "SectionheaderV.h"
#import "Masonry.h"

#define UIColorRGBA(r, g, b, a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@implementation SectionheaderV

- (instancetype)initWithFrame:(CGRect)frame titleInfo:(NSDictionary *)titleInfo {
    self = [super initWithFrame:frame];
    if (self) {
        [self SetUpUI:frame titleInfo:titleInfo];
    }
    return self;
}

- (void)SetUpUI:(CGRect)frame titleInfo:(NSDictionary *)titleInfo{
    
    self.backgroundColor = UIColorRGBA(242, 242, 242, 1.0);
    
    [self addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(12.5);
    }];
    
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line.mas_bottom);
        make.bottom.equalTo(self);
        make.left.equalTo(self.mas_left).offset(12.5);
        make.right.equalTo(self.mas_right).offset(-12.5);
    }];
    
    [self.bgView addSubview:self.redline];
    [self.redline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bgView);
        make.top.equalTo(self.line.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    [self.bgView addSubview:self.excellentGoodslistPic];
    [self.excellentGoodslistPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.redline.mas_bottom);
        make.left.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(130, 25));
    }];
    
    //时
    [self.excellentGoodslistPic addSubview:self.hourLb];
    [self.hourLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.excellentGoodslistPic.mas_left).offset(10);
        make.top.equalTo(self.excellentGoodslistPic.mas_top).offset(3.5);
        make.size.mas_offset(CGSizeMake(18, 18));
    }];
    //分隔符
    [self.excellentGoodslistPic addSubview:self.spaceLb];
    [self.spaceLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hourLb.mas_right);
        make.top.equalTo(self.excellentGoodslistPic.mas_top).offset(3.5);
        make.size.mas_offset(CGSizeMake(6, 18));
    }];
    //分
    [self.excellentGoodslistPic addSubview:self.minutesLb];
    [self.minutesLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.spaceLb.mas_right);
        make.top.equalTo(self.excellentGoodslistPic.mas_top).offset(3.5);
        make.size.mas_offset(CGSizeMake(18, 18));
    }];
    //title
    [self.excellentGoodslistPic addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.minutesLb.mas_right);
        make.top.equalTo(self.excellentGoodslistPic.mas_top);
        make.height.mas_equalTo(25);
    }];
    
    [self.bgView addSubview:self.sectionTitle];
    self.sectionTitle.backgroundColor = [UIColor greenColor];
    [self.sectionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.redline.mas_bottom);
        make.left.equalTo(self.excellentGoodslistPic.mas_right).offset(18);
        make.height.mas_equalTo(25);
    }];
    
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = UIColorRGBA(242, 242, 242, 1.0);
    }
    return _line;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UIView *)redline {
    if (!_redline) {
        _redline = [[UIView alloc] init];
        _redline.backgroundColor = [UIColor redColor];
    }
    return _redline;
}

- (UIImageView *)excellentGoodslistPic {
    if (!_excellentGoodslistPic) {
        _excellentGoodslistPic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"juxing"]];
    }
    return _excellentGoodslistPic;
}

- (UILabel *)hourLb {
    if (!_hourLb) {
        _hourLb = [[UILabel alloc] init];
        _hourLb.backgroundColor = [UIColor whiteColor];
        _hourLb.layer.cornerRadius = 3;
        _hourLb.layer.masksToBounds = YES;
        _hourLb.text = @"20";
        _hourLb.font = [UIFont systemFontOfSize:12];
        _hourLb.textColor = [UIColor redColor];
        _hourLb.textAlignment = NSTextAlignmentCenter;
    }
    return _hourLb;
}

- (UILabel *)spaceLb {
    if (!_spaceLb) {
        _spaceLb = [[UILabel alloc] init];
        _spaceLb.text = @":";
        _spaceLb.font =[UIFont boldSystemFontOfSize:14];
        _spaceLb.textColor = [UIColor whiteColor];
        _spaceLb.textAlignment = NSTextAlignmentCenter;
    }
    return _spaceLb;
}

- (UILabel *)minutesLb {
    if (!_minutesLb) {
        _minutesLb = [[UILabel alloc] init];
        _minutesLb.backgroundColor = [UIColor whiteColor];
        _minutesLb.layer.cornerRadius = 3;
        _minutesLb.layer.masksToBounds = YES;
        _minutesLb.text = @"00";
        _minutesLb.font = [UIFont systemFontOfSize:12];
        _minutesLb.textColor = [UIColor redColor];
        _minutesLb.textAlignment = NSTextAlignmentCenter;

    }
    return _minutesLb;
}

- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.textColor = [UIColor whiteColor];
        _title.font = [UIFont boldSystemFontOfSize:14];
        _title.text = @" 好货榜";
    }
    return _title;
}

- (UILabel *)sectionTitle {
    if (_sectionTitle) {
        _sectionTitle = [[UILabel alloc] init];
        _sectionTitle.font = [UIFont systemFontOfSize:12];
        _sectionTitle.textColor = [UIColor grayColor];
        _sectionTitle.text = @"本场6款商品是由1355人精选而出";
    }
    return _sectionTitle;
}

@end
