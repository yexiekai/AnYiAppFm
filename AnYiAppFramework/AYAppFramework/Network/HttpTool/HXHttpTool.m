//
//  HXHttpTool.m
//  hengxin
//
//  Created by yxk on 15/10/30.
//  Copyright (c) 2015年 yxk. All rights reserved.
//

#import "HXHttpTool.h"
#import "AFNetworking.h"

@implementation HXHttpTool
/**
 *  发送get请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(void) Get:(NSString *)URLString parameters:(id) parameters success:(void(^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    
    //创建请求管理者
    AFHTTPSessionManager *requestManager = [AFHTTPSessionManager manager];
    requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
    [requestManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [requestManager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [requestManager GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject){
        //AFN请求成功时候调用block
        //先把请求成功要做的事情保存到此代码块
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        if (failure) {
            failure(error);
        }
    }];
}

/**
 *  发送post请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(void) Post:(NSString *) URLString parameters:(id) parameters success:(void (^)(id responseObject)) success failure:(void (^)(NSError *error)) failure{
    //创建请求管理者
    AFHTTPSessionManager *requestManager = [AFHTTPSessionManager manager];
    requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
    //[requestManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //[requestManager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [requestManager POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject){
        
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        HXLog(@"result:%@",result);
        //AFN请求成功时候调用block
        //先把请求成功要做的事情保存到此代码块
        if (success) {
            success(result);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        if (failure) {
            failure(error);
        }
    }];
}

@end
