//
//  MVImgModle.m
//  Cuto
//
//  Created by apple on 16/12/27.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import "MVImgModle.h"

@implementation MVImgModle

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
        self.bImgUrl = dict[@"bImgUrl"];
        self.sImgUrl = dict[@"sImgUrl"];
        self.imgID =(long) [dict objectForKey:@"imgId"];
        
    }
    return self;
}

+(instancetype)initWithDict:(NSDictionary *)dict{
    MVImgModle * model = [[self alloc]initWithDict:dict];
    return  model;
}

@end
