//
//  CardView.h
//  DXJ
//
//  Created by Sunshine on 2017/10/26.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DragCardViewComplete)(void);

@interface CardView : UIView


/**
 *  所有展示的卡片
 */
@property (strong, nonatomic)  NSMutableArray *disPlayCardArr;

/**
 *  资源数组
 */
@property (strong, nonatomic)  NSMutableArray *sourceObjectArr;


/**
 *  初始化卡片试图
 *
 @param superView 父视图
 */
+(void)addCardViewWithSuperView:(UIView *)superView;
@end
