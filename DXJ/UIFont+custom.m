//
//  UIFont+custom.m
//  DXJ
//
//  Created by Sunshine on 2017/10/16.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "UIFont+custom.h"

@implementation UIFont (custom)

+(UIFont *)systemFontOfSize:(CGFloat)fontSize {
    return[UIFont fontWithName:@"PingFangSC-Medium"size:fontSize];
}

@end
