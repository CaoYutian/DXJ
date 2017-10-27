//
//  CardViewItem.h
//  DXJ
//
//  Created by Sunshine on 2017/10/26.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import <UIKit/UIKit.h>

//旋转角度
#define ROTATION_ANGLE M_PI/12

//飞出距离极限值，大于直接飞出
#define ACTION_MARGIN_RIGHT 150
#define ACTION_MARGIN_LEFT 150

//飞出速度极限值，大于直接飞出
#define ACTION_VELOCITY 400

//复原时间
#define RESET_ANIMATION_TIME 0.5

//点击飞出时间
#define CLICK_ANIMATION_TIME 0.5

#define PAN_DISTANCE 120

@class CardViewItem;
@protocol DragCardItemDelegate <NSObject>

-(void)swipCard:(CardViewItem *)card Direction:(BOOL) isRight;

-(void)moveCardsX:(CGFloat)xDistance Y:(CGFloat)yDistance;

-(void)moveBackCards;

-(void)adjustOtherCards;

@end


@interface CardViewItem : UIView


/**
 *  初始中心
 */
@property (assign, nonatomic) CGPoint originalCenter;


/**
 *  初始状态
 */
@property (assign, nonatomic) CGAffineTransform originalTransform;


/**
 *  代理
 */
@property (weak,   nonatomic) id <DragCardItemDelegate> delegate;

@end

