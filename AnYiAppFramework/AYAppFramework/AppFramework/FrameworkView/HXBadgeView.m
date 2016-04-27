//
//  HXBadgeView.m
//  hengxin
//
//  Created by 许毅 on 15/11/13.
//  Copyright © 2015年 许毅. All rights reserved.
//

#import "HXBadgeView.h"

#define BadgeViewFontSize    [UIFont systemFontOfSize:11]

@implementation HXBadgeView

/**
 *  初始化tabBar的badgeView对象
 *
 *  @param frame 参数badgeView的frame
 *
 *  @return 返回实例对象
 */
-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = BadgeViewFontSize;
        [self sizeToFit];
    }
    return self;
}

-(void) setBadgeValue:(NSString *)badgeValue{
    _badgeValue = badgeValue;
    
    //判断badgeValue是否有内容，如果有内容则显示，没有内容或内容为空则隐藏
    if ([badgeValue isEqualToString:@"0"] || badgeValue == nil || [badgeValue isEqualToString:@""]) {
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
    
    [self setTitle:badgeValue forState:UIControlStateNormal];
    
    /**
     *  根据给定的内容、字体，宽度，计算文本高度的函数，iOS7之前使用sizeWithFont，iOS7之后使用boundingRectWithSize
     *  @param MAXFLOAT
     *  @param MAXFLOAT
     */
    CGFloat titleWidth = [badgeValue boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:BadgeViewFontSize} context:nil].size.width;
    
    if (titleWidth > self.frame.size.width) {
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
}

@end
