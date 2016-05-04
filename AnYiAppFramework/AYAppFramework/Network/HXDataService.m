//
//  HXDataService.m
//  AnYiAppFramework
//
//  Created by yxk on 16/5/3.
//  Copyright © 2016年 Insigma HengTian Software Ltd. All rights reserved.
//

#import "HXDataService.h"
#import "AFNetworking.h"

@interface HXDataService ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation HXDataService

#pragma mark - private httpRequest
/**
 *  http json request基本函数，用于纪录失败的request请求
 *
 *  @param URLString  url相对路径
 *  @param parameters 传入的参数
 *  @param method     请求方法 POST和GET
 *  @param success    成功回调函数
 *  @param failure    失败回调函数
 *
 *   @return NSURLSessionDataTask 用于处理网络传输过程中的状态
 */
- (NSURLSessionDataTask *)httpRequestWithURLString:(NSString *)URLString
                                        parameters:(id)parameters
                                            method:(HTTPMethod) method
                                           success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                           failure:(void (^)(NSError *error))failure {
    
    // 网络状态
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    //成功的block
    void (^localSuccess)(NSURLSessionDataTask *task, id responseObject) = ^(NSURLSessionDataTask *task, id responseObject) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        //NSString *debugStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        success(task, responseObject);
    };
    
    //失败的block
    void (^localFailure)(NSURLSessionDataTask *task, NSError *error) = ^(NSURLSessionDataTask *task, NSError *error) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        HXLog(@"http request failed, with Error: \n%@", [error description]);
        failure(error);
    };
    
    
    NSURLSessionDataTask *task = nil;
    if (method == POST) {
        task = [self.sessionManager POST:URLString parameters:parameters success:localSuccess failure:localFailure];
    }else if (method == GET){
        NSString *URLGetString = [NSString stringWithFormat:@"%@?%@",URLString, parameters];
        task = [self.sessionManager GET:URLGetString parameters:parameters success:localSuccess failure:localFailure];
    }
    
    
    return task;
}

#pragma mark - public unwraped httpRequest
/**
 *  1.unwrap返回的JSON，以NSDictionary为对象
 *  2.成功返回后，取code的值， ACK表示成功， NACK表示失败
 *  3.如果是Session timeout， 重新登录后再试，如果失败，弹出登录界面
 *  4.网络问题或其他错误一律通过failure处理
 *
 *  @param URLString  url相对路径
 *  @param parameters 传入的参数
 *  @param method     请求方法 POST和GET
 *  @param success    成功回调函数
 *  @param failure    失败回调函数
 *
 *  @return NSURLSessionDataTask 用于处理网络传输过程中的状态
 */

- (NSURLSessionDataTask *)httpRequestUnPackWithURLString:(NSString *)URLString
                                              parameters:(id)parameters
                                                  method:(HTTPMethod) method
                                                showMask:(BOOL) willShowMask
                                                 success:(void (^)(NSURLSessionDataTask *task, id data, NSString *code, NSString *message, NSString * nonBizError))success
                                                 failure:(void (^)(NSError *error))failure {
    
    //弹出透明遮罩，保护数据加载顺利完成
//    if (willShowMask) {
//        if (!_maskView) {
//            UIView *view = [[UIApplication sharedApplication].windows lastObject];
//            _maskView = [[UIView alloc]initWithFrame:view.bounds];
//            [view addSubview:_maskView];
//        }
//    }
    
    //调用http请求
    NSURLSessionDataTask *task = [self httpRequestWithURLString:URLString parameters:parameters
                                                         method:method
                                                        success:^(NSURLSessionDataTask *task, id responseObject) {
//                                                            HXHttpResponseWraper *response = [HXHttpResponseWraper mj_objectWithKeyValues:responseObject];
//                                                            
//                                                            success(task, response.data, response.code, response.message, response.nonBizError);
//                                                            [self unMaskView];
                                                            
                                                            
                                                        } failure:^(NSError *error) {
                                                            
                                                            NSHTTPURLResponse *httpURLresponse = nil;
                                                            for (NSString *key in error.userInfo) {
                                                                if ([error.userInfo[key] isKindOfClass:[NSHTTPURLResponse class]]) {
                                                                    httpURLresponse =error.userInfo[key];
                                                                }
                                                            }
                                                            //超时的情况下statusCode 401 unauthorized, 需要重新登录后发请求
                                                            if (httpURLresponse.statusCode == 401) {
                                                                
//                                                                [self reloginWithsuccess:^(NSString *message) {
//                                                                    if ([message isEqualToString:@"ACK"]) {
//                                                                        /* 再试一次*/
//                                                                        [self httpRequestUnPackWithURLString:URLString parameters:parameters method:method showMask:FALSE success:success failure:failure];
//                                                                    }
//                                                                    
//                                                                } failure:^(NSError *error) {
//                                                                    [self unMaskView];
//                                                                    [MBProgressHUD showError:@"网路异常"];
//                                                                    failure(error);
//                                                                }];
//                                                                
//                                                                return;
//                                                                
                                                            }
//                                                            failure(error);
//                                                            [self unMaskView];
//                                                            [MBProgressHUD showError:@"网路异常"];
                                                            
                                                            
                                                        }];
    
    return task;
    
}

@end
