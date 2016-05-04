//
//  HXTabBar.m
//  hengxin
//
//  Created by yxk on 15/11/13.
//  Copyright © 2015年 yxk. All rights reserved.
//

#import "HXTabBar.h"
#import "HXTabBarButton.h"

@interface HXTabBar ()
//tabBar中间的“+”按钮,在这个应用里面用不到
//@property(nonatomic, weak) UIButton *plusButton;

@property(nonatomic, strong) NSMutableArray *buttons;

@property(nonatomic, weak) UIButton *selectedButton;
@end

@implementation HXTabBar

-(NSMutableArray *) buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void) setTabItems:(NSArray *)tabItems{
    
    _tabItems = tabItems;
    
    //遍历创建tabBarButton
    for (UITabBarItem *item in _tabItems) {
        HXTabBarButton *btn = [HXTabBarButton buttonWithType:UIButtonTypeCustom];
        
        btn.item = item;
        
        btn.tag = self.buttons.count;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        
        [self addSubview:btn];
        
        [self.buttons addObject:btn];
    }
}


// 点击tabBarButton调用
-(void)btnClick:(UIButton *)button
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    // 通知tabBarVc切换控制器，
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}

/*实现tabBar中间的"+"号button的方法，在本应用里面用不到，所以将本代码予以注释处理
- (UIButton *)plusButton
{
    if (_plusButton == nil) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        // 默认按钮的尺寸跟背景图片一样大
        // sizeToFit:默认会根据按钮的背景图片或者image和文字计算出按钮的最合适的尺寸
        [btn sizeToFit];
        
        _plusButton = btn;
        
        [self addSubview:_plusButton];
        
    }
    return _plusButton;
}
*/

// self.items UITabBarItem模型，有多少个子控制器就有多少个UITabBarItem模型
// 调整子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    //CGFloat btnW = w / (self.tabItems.count + 1);
    CGFloat btnW = w / self.tabItems.count;
    CGFloat btnH = self.bounds.size.height;
    
    int i = 0;
    // 设置tabBarButton的frame
    for (UIView *tabBarButton in self.buttons) {
        /*
        if (i == 2) {
            i = 3;
        }
        */
        btnX = i * btnW;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;
    }
    
    
    // 设置添加按钮的位置
    //self.plusButton.center = CGPointMake(w * 0.5, h * 0.5);
    
}


@end
