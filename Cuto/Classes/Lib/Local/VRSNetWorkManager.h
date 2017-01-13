//
//  VRSNetWorkManager.h
//  ShowGrill
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 virus. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPSessionManager.h"

typedef enum{
    GET,
    POST
}HttpMethod;

@interface VRSNetWorkManager : NSObject

@property(nonatomic , strong)AFHTTPSessionManager * httpManager;

@property(nonatomic , strong)NSMutableArray * modelAry;

+(instancetype)sharedManager;

/// GET POST 请求
-(void)httpRequest:(HttpMethod)method url:(NSString *)url parameters:(id)parameters progress:(void(^)(NSProgress *  downloadProgress)) progress success:(void(^)(NSURLSessionDataTask * task, NSDictionary * responseObject))suceess failure:(void(^)(NSURLSessionDataTask * task, NSError *  error))failure;

+(void)httpRequest:(HttpMethod)method url:(NSString *)url parameters:(id)parameters progress:(void(^)(NSProgress *  downloadProgress)) progress success:(void(^)(NSURLSessionDataTask * task, NSDictionary * responseObject))suceess failure:(void(^)(NSURLSessionDataTask * task, NSError *  error))failure;


@end
