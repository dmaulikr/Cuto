//
//  MVImgBtn.h
//  Cuto
//
//  Created by apple on 16/12/28.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^vvBlock)();

@interface MVImgBtn : UIImageView

@property(nonatomic , copy)vvBlock clickBlock;

@property(nonatomic , copy)NSString * imgUrl;


-(instancetype)initWithImgURL:(NSString *)url clickBlock:(vvBlock)block;
@end

