//
//  DrawrectVC.m
//  DXJ
//
//  Created by Sunshine on 2017/10/9.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "DrawrectVC.h"
#import "drawRect.h"
#import "drawRectView.h"
@interface DrawrectVC ()

@end

@implementation DrawrectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawRectView];
}

- (void)drawRectView {
    
//    drawRect *draw = [[drawRect alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:draw];
    
    drawRectView *draw = [[drawRectView alloc] initWithFrame:self.view.frame];
    draw.backgroundColor = [UIColor greenColor];
    
    //设置阴影的颜色
    draw.layer.shadowColor=[UIColor blackColor].CGColor;
    //设置阴影的偏移量，如果为正数，则代表为往右边偏移
    draw.layer.shadowOffset=CGSizeMake(2, 4);
    //设置阴影的透明度(0~1之间，0表示完全透明)
    draw.layer.shadowOpacity=0.6;
    
    [self.view addSubview:draw];
}

@end
