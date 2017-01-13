//
//  VRSNetWorkManager.m
//  ShowGrill
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 virus. All rights reserved.
//

#import "VRSNetWorkManager.h"

@implementation VRSNetWorkManager

static VRSNetWorkManager * manager = nil;

+(instancetype)sharedManager{
    
    static dispatch_once_t onceToken;
     
    dispatch_once(&onceToken, ^{
        manager = [[VRSNetWorkManager alloc] init];
        
        manager.httpManager = [AFHTTPSessionManager manager];
        
        [manager.httpManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/plain",@"text/javascript", nil]];
    });
    
    return manager;
}

-(void)httpRequest:(HttpMethod)method url:(NSString *)url parameters:(id)parameters progress:(void(^)(NSProgress *  downloadProgress)) progress success:(void(^)(NSURLSessionDataTask * task, NSDictionary * responseObject))suceess failure:(void(^)(NSURLSessionDataTask * task, NSError *  error))failure{

    if (method == GET) {
        [_httpManager GET:url parameters:parameters progress:progress success:suceess failure:failure];
    }else if(method == POST){
        [_httpManager POST:url parameters:parameters progress:progress success:suceess failure:failure];
    }
}

+(void)httpRequest:(HttpMethod)method url:(NSString *)url parameters:(id)parameters progress:(void(^)(NSProgress *  downloadProgress)) progress success:(void(^)(NSURLSessionDataTask * task, NSDictionary * responseObject))suceess failure:(void(^)(NSURLSessionDataTask * task, NSError *  error))failure{
    
    VRSNetWorkManager * manager = [self sharedManager];

    [manager httpRequest:method url:url parameters:parameters progress:progress success:suceess failure:failure];
    
}


@end
