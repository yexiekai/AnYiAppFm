//
//  HXTabBar.h
//  hengxin
//
//  Created by 许毅 on 15/11/13.
//  Copyright © 2015年 许毅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HXTabBar;
@protocol HXTabBarDelegate <NSObject>

@optional
-(void) tabBar:(HXTabBar *) tabBar didClickButton:(NSInteger) index;
@end

@interface HXTabBar : UIView
@property(nonatomic, strong) NSArray *tabItems;
@property(nonatomic, weak) id<HXTabBarDelegate> delegate;
@end
