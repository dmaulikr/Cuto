//
//  MVImgCollectionViewCell.m
//  Cuto
//
//  Created by apple on 16/11/18.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import "MVImgCollectionViewCell.h"
#import "SDImageCache.h"
#import "UIButton+WebCache.h"
#import "UIView+SDAutoLayout.h"
#import "MVImgOrgViewController.h"
#import "SDWebImageManager.h"
#import "WLCircleProgressView.h"
#import "MVImgBtn.h"

@interface MVImgCollectionViewCell()

@property(nonatomic , weak)MVImgBtn * imgBtn;

@end


@implementation MVImgCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor blackColor];
        
        MVImgBtn * imgBtnn = [[MVImgBtn alloc] init];
        _imgBtn = imgBtnn;
        [self.contentView addSubview:imgBtnn];
        
        _imgBtn.sd_layout.topEqualToView(self.contentView).offset(5)
        .leftEqualToView(self.contentView).offset(5)
        .rightEqualToView(self.contentView).offset(-5)
        .bottomEqualToView(self.contentView).offset(-5);

    }
    return self;
}


-(void)setModel:(MVImgModle *)model{
    _model = model;
    _imgBtn.imgUrl = model.sImgUrl;
    _imgBtn.clickBlock = ^(){
        [self showImg];
    };

}

-(void)showImg{
    UIViewController * vc =  [UIApplication sharedApplication].keyWindow.rootViewController;
    MVImgOrgViewController * tavc = [MVImgOrgViewController new];
    tavc.url = self.model.bImgUrl;
    [vc presentViewController:tavc animated:YES completion:nil];
}

@end
