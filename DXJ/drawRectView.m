//
//  drawRectView.m
//  DXJ
//
//  Created by Sunshine on 2017/10/9.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "drawRectView.h"

@implementation drawRectView

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    //获取ctx
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //画多边形+原型+文字
   
    [self drawSharp:ctx content:@"亲和材料无污染"];
}

//画矩形,画椭圆，多边形
-(void)drawSharp:(CGContextRef)ctx content:(NSString *)content{
    
    CGFloat sharpHeight = 16;
    UIFont *font = [UIFont systemFontOfSize:12];
    
    CGSize reasonBtnsize = [content sizeWithAttributes:@{NSFontAttributeName:font}];
    CGFloat sharpWidth = reasonBtnsize.width + sharpHeight;
    
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    //画多边形，多边形是通过path完成的
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, &CGAffineTransformIdentity, 20, 200);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 20 + sharpWidth, 200);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 20 + sharpWidth + sharpHeight / 2, 200 + sharpHeight / 2);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 20 + sharpWidth, 200 + sharpHeight);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, 20, 200 + sharpHeight);
    CGPathCloseSubpath(path);
    CGContextAddPath(ctx, path);
    
    //填充
    CGContextFillPath(ctx);
    
    //画圆
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    /* 绘制路径 方法一
     void CGContextAddArc (
     CGContextRef c,
     CGFloat x,             //圆心的x坐标
     CGFloat y,    //圆心的x坐标
     CGFloat radius,   //圆的半径
     CGFloat startAngle,    //开始弧度
     CGFloat endAngle,   //结束弧度
     int clockwise          //0表示顺时针，1表示逆时针
     );
     */
    //圆
    CGContextAddArc (ctx, 20 + sharpWidth, 200 + sharpHeight / 2, 2.5, 0, M_PI* 2 , 0);
    CGContextFillPath(ctx);
    
    //文字样式
    NSDictionary *dict = @{NSFontAttributeName:font,
                           NSForegroundColorAttributeName:[UIColor orangeColor]};
    [content drawInRect:CGRectMake(25 , 200, sharpWidth, sharpHeight) withAttributes:dict];

}

@end
