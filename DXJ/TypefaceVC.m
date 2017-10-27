//
//  TypefaceVC.m
//  DXJ
//
//  Created by Sunshine on 2017/10/16.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "TypefaceVC.h"
#import "CardView.h"
#import "CardViewConstants.h"


@interface TypefaceVC ()

@end

@implementation TypefaceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"各种字体";

    [self SetUpUI];
}

- (void)SetUpUI {
    
    UILabel *Lb0 = [[UILabel alloc] initWithFrame:CGRectMake(150, 60, self.view.frame.size.width - 40, 20)];
    Lb0.font = [UIFont systemFontOfSize:16];
    Lb0.text = @"苹方-简 常规体0";
    [self.view addSubview:Lb0];
    
    UILabel *Lb1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, self.view.frame.size.width - 40, 20)];
    Lb1.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    Lb1.text = @"苹方-简 常规体";
    [self.view addSubview:Lb1];
    
    UILabel *Lb2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 30)];
    Lb2.font = [UIFont fontWithName:@"PingFangSC-Ultralight" size:16];
    Lb2.text = @"苹方-简 极细体";
    [self.view addSubview:Lb2];
    
    UILabel *Lb3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, self.view.frame.size.width - 40, 30)];
    Lb3.font = [UIFont fontWithName:@"PingFangSC-Light" size:16];
    Lb3.text = @"苹方-简 细体";
    [self.view addSubview:Lb3];
    
    UILabel *Lb4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 180, self.view.frame.size.width - 40, 30)];
    Lb4.font = [UIFont fontWithName:@"PingFangSC-Thin" size:16];
    Lb4.text = @"苹方-简 纤细体";
    [self.view addSubview:Lb4];
    
    UILabel *Lb5 = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, self.view.frame.size.width - 40, 30)];
    Lb5.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    Lb5.text = @"苹方-简 中黑体";
    [self.view addSubview:Lb5];
    
    UILabel *Lb6 = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, self.view.frame.size.width - 40, 30)];
    Lb6.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];
    Lb6.text = @"苹方-简 中粗体";
    [self.view addSubview:Lb6];
    
    UILabel *Lb7 = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, self.view.frame.size.width - 40, 30)];
    Lb7.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    Lb7.text = @"苹方-简 常规体";
    [self.view addSubview:Lb7];
    
    UILabel *Lb8 = [[UILabel alloc] initWithFrame:CGRectMake(20, 340, self.view.frame.size.width - 40, 30)];
    Lb8.font = [UIFont fontWithName:@"Helvetica" size:16];
    Lb8.text = @"苹方-简 常规体";
    Lb8.backgroundColor = [UIColor greenColor];
    Lb8.layer.shadowColor = [UIColor blackColor].CGColor;
    Lb8.layer.shadowOffset = CGSizeMake(2, 4);
    Lb8.layer.shadowOpacity = 0.6;
    [self.view addSubview:Lb8];
    
    for(NSString *fontFamilyName in [UIFont familyNames]) {
        NSLog(@"family:'%@'",fontFamilyName);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName]) {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
}

@end
