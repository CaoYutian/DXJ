
//
//  homeTableViewCell.m
//  DXJ
//
//  Created by Sunshine on 2017/10/8.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "homeTableViewCell.h"
#import "Masonry.h"

#define UIColorRGBA(r, g, b, a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@implementation homeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildCellView];
    }
    return self;
}

- (void)buildCellView{
    
    self.contentView.backgroundColor = UIColorRGBA(242, 242, 242, 1.0);
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(12.5);
        make.right.equalTo(self.contentView.mas_right).offset(-12.5);
    }];
    
    [self.bgView addSubview:self.goodsPic];
    [self.goodsPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.bgView).offset(10);
        make.size.mas_equalTo(CGSizeMake(107.5, 107.5));
    }];
    
    [self.goodsPic addSubview:self.tagBtn];
    [self.tagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.goodsPic);
        make.size.mas_equalTo(CGSizeMake(18.5, 21));
    }];
    
    [self.bgView addSubview:self.goodsTitle];
    [self.goodsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsPic.mas_top).offset(14);
        make.left.equalTo(self.goodsPic.mas_right).offset(15);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
    }];
    
    [self.bgView addSubview:self.goodsDetailTitle];
    [self.goodsDetailTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsTitle.mas_bottom).offset(14);
        make.left.equalTo(self.goodsPic.mas_right).offset(15);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
    }];
    
    [self.bgView addSubview:self.discountsPricePic];
    [self.discountsPricePic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsDetailTitle.mas_bottom).offset(14);
        make.left.equalTo(self.goodsPic.mas_right).offset(15);
        make.size.mas_equalTo(CGSizeMake(30, 12));
    }];
    
    [self.bgView addSubview:self.discountsPrice];
    [self.discountsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.discountsPricePic.mas_bottom);
        make.left.equalTo(self.discountsPricePic.mas_right).offset(5);
        make.height.mas_equalTo(14);
    }];
    
    [self.bgView addSubview:self.beatPic];
    [self.beatPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsDetailTitle.mas_bottom).offset(13);
        make.left.equalTo(self.discountsPrice.mas_right).offset(42.5);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.bgView addSubview:self.beatNum];
    [self.beatNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.beatPic.mas_bottom);
        make.left.equalTo(self.beatPic.mas_right).offset(5);
        make.height.mas_equalTo(14);
    }];
    
    [self.bgView addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsPic.mas_bottom).offset(9);
        make.left.equalTo(self.goodsPic.mas_right).offset(15);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.height.mas_equalTo(1);
    }];
    
}

- (NSMutableAttributedString *)addAttribute:str firstColorValue:(id)firstColor secondColorValue:(id)secondColor firstFont:(id)firstFont  secondFont:(id)secondFont firstRange:(NSRange)firstRange secondRange:(NSRange)secondRange; {
    
    NSMutableAttributedString *Attri = [[NSMutableAttributedString alloc] initWithString:str];
    [Attri addAttribute:NSForegroundColorAttributeName value:firstColor range:firstRange];
    [Attri addAttribute:NSFontAttributeName value:firstFont range:firstRange];
    
    [Attri addAttribute:NSForegroundColorAttributeName value:secondColor range:secondRange];
    [Attri addAttribute:NSFontAttributeName value:secondFont range:secondRange];
    
    return Attri;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UIImageView *)goodsPic {
    if (!_goodsPic) {
        _goodsPic = [[UIImageView alloc] init];
        _goodsPic.image = [UIImage imageNamed:@""];
        _goodsPic.backgroundColor = [UIColor greenColor];
    }
    return _goodsPic;
}

- (UIButton *)tagBtn {
    if (!_tagBtn) {
        _tagBtn = [[UIButton alloc] init];
        [_tagBtn setBackgroundImage:[UIImage imageNamed:@"m1"] forState:UIControlStateNormal];
    }
    return _tagBtn;
}

- (UILabel *)goodsTitle {
    if (!_goodsTitle) {
        _goodsTitle = [[UILabel alloc] init];
        _goodsTitle.font = [UIFont systemFontOfSize:14];
        _goodsTitle.textColor = [UIColor blackColor];
        _goodsTitle.text = @"隆力奇蛇油护手霜50g*3支";
    }
    return _goodsTitle;
}

- (UILabel *)goodsDetailTitle {
    if (!_goodsDetailTitle) {
        _goodsDetailTitle = [[UILabel alloc] init];
        _goodsDetailTitle.font = [UIFont systemFontOfSize:12];
        _goodsDetailTitle.textColor = [UIColor lightGrayColor];
        _goodsDetailTitle.lineBreakMode = NSLineBreakByTruncatingHead;
        _goodsDetailTitle.numberOfLines = 0;
        _goodsDetailTitle.text = @"【50g*3支 再送3袋蛇油膏 券后只要6.9】一年四季都可以用的护手霜";
    }
    return _goodsDetailTitle;
}

- (UIImageView *)discountsPricePic {
    if (!_discountsPricePic) {
        _discountsPricePic = [[UIImageView alloc] init];
        _discountsPricePic.image = [UIImage imageNamed:@"quanhouj"];
    }
    return _discountsPricePic;
}

- (UILabel *)discountsPrice {
    if (!_discountsPrice) {
        _discountsPrice = [[UILabel alloc] init];
        _discountsPrice.textColor = [UIColor redColor];
        
        NSMutableAttributedString *unitPriceAttri = [self addAttribute:@"¥29" firstColorValue:[UIColor redColor] secondColorValue:[UIColor redColor] firstFont:[UIFont boldSystemFontOfSize:8] secondFont:[UIFont boldSystemFontOfSize:15] firstRange:NSMakeRange(0, 1) secondRange:NSMakeRange(1, 2)];
        _discountsPrice.attributedText = unitPriceAttri;
    }
    return _discountsPrice;
}

- (UIImageView *)beatPic {
    if (!_beatPic) {
        _beatPic = [[UIImageView alloc] init];
        _beatPic.image = [UIImage imageNamed:@"beat"];
    }
    return _beatPic;
}

- (UILabel *)beatNum {
    if (!_beatNum) {
        _beatNum = [[UILabel alloc] init];
        _beatNum.textColor = [UIColor lightGrayColor];
        _beatNum.text = @"1234人叫好";
        _beatNum.font = [UIFont systemFontOfSize:12];
    }
    return _beatNum;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = UIColorRGBA(242, 242, 242, 1.0);
    }
    return _line;
}

@end
