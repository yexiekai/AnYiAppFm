//
//  UIView+Frame.h
//  hengxin
//
//  Created by yxk on 15/10/28.
//  Copyright (c) 2015年 yxk. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 分类不能添加成员属性
 * @property如果在分类里面，只会自动生成get,set方法的声明，不会生成成员属性，和方法的实现
 */
@interface UIView (Frame)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;

@end
