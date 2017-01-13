//
//  MVImgBtn.m
//  Cuto
//
//  Created by apple on 16/12/28.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import "MVImgBtn.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
@implementation MVImgBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/*
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        UIImageView *imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(125, 50, 229, 229)];
//        [imageview1 setImage:[UIImage imageWithContentsOfFile:path]];
//        imageview1.userInteractionEnabled = YES;
//        UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonpress1:)];
//        [imageview1 addGestureRecognizer:singleTap1];
//        [singleTap1 release];
//        [myScrollView addSubview:imageview1];
//        [imageview1 release];
        NSLog(@"hehe-%@",self.imgUrl);
    }
    return self;
}
*/

-(instancetype)initWithImgURL:(NSString *)url clickBlock:(vvBlock)block{
    if (self = [super init]) {
        self.imgUrl = url;
        self.clickBlock = block;
        
        
        
        
//        UIGestureRecognizer *singleTap = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction:)];
    }
    return  self;
}

-(void)setImgUrl:(NSString *)imgUrl{
    self.contentMode =UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
    
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * singleTapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBtn)];
    [self addGestureRecognizer:singleTapOne];
    
    [self sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"placeholderImage.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

-(void)clickBtn{
    NSLog(@"点击了图片！");
    self.clickBlock();
}

@end
