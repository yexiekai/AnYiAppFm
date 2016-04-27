//
//  HXTabBarController.m
//  AnYiAppFramework
//
//  Created by yxk on 16/4/26.
//  Copyright © 2016年 Insigma HengTian Software Ltd. All rights reserved.
//

#import "HXTabBarController.h"
#import "HXNavigationController.h"

#import "HXHomeViewController.h"
#import "HXProductListViewController.h"
#import "HXProfileHomeViewController.h"
#import "HXMoreViewController.h"

#import "UIImage+Image.h"

@interface HXTabBarController ()
@property(nonatomic, strong) NSMutableArray *items;
@end

@implementation HXTabBarController

- (void)viewDidLoad
{
    [self createAllChildViewController];
    [self createTabBar];
}

- (void)createAllChildViewController {
    // 首页
    HXHomeViewController *home = [[HXHomeViewController alloc] init];
    
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"首页"];
    
    //产品列表
    HXProductListViewController *productList = [[HXProductListViewController alloc] init];
    [self setUpOneChildViewController:productList image:[UIImage imageNamed:@"tabbar_investment"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_investment_selected"] title:@"我要投资"];
    
    //我的账户
    HXProfileHomeViewController *profile = [[HXProfileHomeViewController alloc] init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"我的账户"];
    
    //更多
    HXMoreViewController *more = [[HXMoreViewController alloc] init];
    [self setUpOneChildViewController:more image:[UIImage imageNamed:@"tabbar_more"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_more_selected"] title:@"更多"];
}

- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    [self.items addObject:vc.tabBarItem];
//    //未选中字体颜色
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HXFONT_COLOR_BLACK,NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f]} forState:UIControlStateNormal];
//
//    //选中字体颜色
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HXFONT_COLOR_BLUE,NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f]} forState:UIControlStateSelected];
    
    //self.tabBar.tintColor = HXFONT_COLOR_BLUE;
    
    HXNavigationController *nav = [[HXNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

-(void) createTabBar{
    //初始化自定义tabBar
    HXTabBar *tabBar = [[HXTabBar alloc] initWithFrame:self.tabBar.bounds];
    //设置代理
    tabBar.delegate = self;
    
    tabBar.backgroundColor = [UIColor whiteColor];
    
    //给tabBar传递tabBarItem模型
    tabBar.tabItems = self.items;
    
    //添加自定义tabBar
    [self.tabBar addSubview:tabBar];
}

@end
