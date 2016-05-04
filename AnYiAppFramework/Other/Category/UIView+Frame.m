//
//  UIView+Frame.m
//  hengxin
//
//  Created by yxk on 15/10/28.
//  Copyright (c) 2015年 yxk. All rights reserved.
//

#import "UIView+Frame.h"
/**
 *  get或者set View元素的x、y坐标值和width、height尺寸
 */
@implementation UIView (Frame)

/**
 *  设置对象的x坐标值
 *
 *  @param x; 参数 x 的数据类型为CGFloat
 */
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

/**
 *  获取对象的x坐标值
 *
 *  @return x; 返回值 x 的数据类型为CGFloat
 */
- (CGFloat)x
{
    return self.frame.origin.x;
}

/**
 *  设置对象的y坐标值
 *
 *  @param y; 参数 y 的数据类型为CGFloat
 */
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

/**
 *  获取对象的y坐标值
 *
 *  @return y; 返回值 y 的数据类型为CGFloat
 */
- (CGFloat)y
{
    return self.frame.origin.y;
}

/**
 *  获取对象的宽度width
 *
 *  @return width; 返回值 width 的数据类型为CGFloat
 */
- (CGFloat)width
{
    return self.frame.size.width;
}

/**
 *  设置对象的宽度width
 *
 *  @return width; 参数 width 的数据类型为CGFloat
 */
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

/**
 *  获取对象的高度height
 *
 *  @return height; 返回值 height 的数据类型为CGFloat
 */
- (CGFloat)height
{
    return self.frame.size.height;
}

/**
 *  设置对象的高度height
 *
 *  @return height; 参数 height 的数据类型为CGFloat
 */
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

@end
