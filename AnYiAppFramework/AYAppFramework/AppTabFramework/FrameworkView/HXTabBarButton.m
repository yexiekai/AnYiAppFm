//
//  HXTabBarButton.m
//  hengxin
//
//  Created by yxk on 15/11/13.
//  Copyright © 2015年 yxk. All rights reserved.
//

#import "HXTabBarButton.h"
#import "HXBadgeView.h"
#import "UIView+Frame.h"

/**
 *  HXTabBar相关的宏定义
 *  BadgeViewFontSize    切换tabBar的子控件badgeView气泡的文字字号
 *  TabBarButtonFontSize 切换tabBar的文字字号
 *
 *  @return <#return value description#>
 */
#define BadgeViewFontSize    [UIFont systemFontOfSize:11]
#define TabBarButtonFontSize [UIFont systemFontOfSize:12]
#define HXImageRadio          0.7

@interface HXTabBarButton()

@property(nonatomic, weak) HXBadgeView *badgeView;

@end

@implementation HXTabBarButton
-(void) setHighlighted:(BOOL)highlighted{}

//懒加载badgeView
-(HXBadgeView *) badgeView{
    if (_badgeView == nil) {
        HXBadgeView *btn = [HXBadgeView buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _badgeView = btn;
    }
    
    return _badgeView;
}

/**
 *  重写tabBarButton的initWithFrame方法
 *
 *  @param frame
 *
 *  @return 返回一个tabBarButton的实例对象
 */
-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        
        //设置图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //设置文字居中对齐
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //设置tabBar的文字大小
        self.titleLabel.font = TabBarButtonFontSize;
    }
    return self;
}

// 传递UITabBarItem给tabBarButton,给tabBarButton内容赋值
-(void) setItem:(UITabBarItem *)item{
    _item = item;
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    // KVO：时刻监听一个对象的属性有没有改变
    // 给谁添加观察者
    // Observer:按钮
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
}

//监听属性的值有更新时调用
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithRed:36/255.0 green:138/255.0 blue:238/255.0 alpha:1] forState:UIControlStateSelected];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    self.badgeView.badgeValue = _item.badgeValue;
}

/**
 *  设置tabBarButton元素里面的各个子控件的frame
 */
-(void) layoutSubviews{
    [super layoutSubviews];
    
    //imageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = self.bounds.size.width;
    CGFloat imageHeight = self.bounds.size.height * HXImageRadio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
    
    //title
    CGFloat titleX = 0;
    CGFloat titleY = imageHeight - 8;
    CGFloat titleWidth = self.bounds.size.width;
    CGFloat titleHeight = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleWidth, titleHeight);
    
    //badgeView
    self.badgeView.x = self.width - self.badgeView.width - 10;
    self.badgeView.y = 0;
}

@end
