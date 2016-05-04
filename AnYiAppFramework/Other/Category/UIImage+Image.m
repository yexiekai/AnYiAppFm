//
//  UIImage+Image.m
//  hengxin
//
//  Created by yxk on 15/10/28.
//  Copyright (c) 2015年 yxk. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
/**
 *  加载原始图片的效果，不需要系统额外加上的渲染颜色等效果
 *
 *  @param imageName; NSString类型的图片名称
 *
 *  @return (UIImage)instancetype
 */
+ (instancetype) imageWithOriginalName:(NSString *) imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

/**
 *  创建一个内容可拉伸，而边角不拉伸的图片，需要两个参数，第一个是左边不拉伸区域的宽度，第二个参数是上面不拉伸的高度。那么接下来的一个像素会被拉伸。
 *
 *  @param imageName; NSString类型的图片名称
 *
 *  @return (UIImage)instancetype
 */
+ (instancetype) imageWithStrentchableName:(NSString *) imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}

@end
