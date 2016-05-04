//
//  HXHttpTool.h
//  hengxin
//
//  Created by yxk on 15/10/30.
//  Copyright (c) 2015年 yxk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXHttpTool : NSObject
/**
 *  发送get请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(void) Get:(NSString *)URLString
 parameters:(id) parameters
    success:(void(^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

/**
 *  发送get请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(void) Post:(NSString *) URLString
  parameters:(id) parameters
     success:(void (^)(id responseObject)) success
     failure:(void (^)(NSError *error)) failure;
@end
