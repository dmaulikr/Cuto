//
//  MVImgModle.h
//  Cuto
//
//  Created by apple on 16/12/27.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVImgModle : NSObject

@property(nonatomic , copy)NSString * bImgUrl;
@property(nonatomic , copy)NSString * sImgUrl;
@property(nonatomic , assign)NSInteger * imgID;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)initWithDict:(NSDictionary *)dict;
@end
