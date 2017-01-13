//
//  MVImgOrgViewController.m
//  Cuto
//
//  Created by apple on 16/11/23.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import "MVImgOrgViewController.h"
#import "UIView+SDAutoLayout.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "WLCircleProgressView.h"
@interface MVImgOrgViewController ()<UIScrollViewDelegate>

@property(nonatomic , weak)UIView * botView;
@property(nonatomic , weak)UIButton * switchBtn;
@property(nonatomic , weak)UIButton * showBtn;
@property(nonatomic , weak)UIButton * dowBtn;

@property(nonatomic , weak)UIImageView * imgView;

@property(nonatomic , weak)UIImageView * showView;

@property(nonatomic , assign)CGPoint previousPoint;
@property(nonatomic , weak)UIScrollView * scrollView;

@end

@implementation MVImgOrgViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    [self setUI];
    
    CGRect prect = CGRectMake(30, 30, 0, 0);
    CGRect prectB = CGRectMake(30, 5, 30, 5);
    __block WLCircleProgressView * cProView = [WLCircleProgressView viewWithFrame:prect circlesSize:prectB];
    //size = CGRectMake(背景圆环半径, 背景圆环线宽, 前面圆环半径, 后面圆环线宽)
    cProView.progressValue = 0.0;
    cProView.center = self.view.center;
    NSLog(@"[%@]",_url);
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:_url] options:1 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (![self.view.subviews containsObject:cProView]) {
            [self.view addSubview:cProView];
        }
        
        CGFloat pro = (CGFloat)receivedSize / (CGFloat)expectedSize;
        cProView.progressValue = pro;
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        self.imgFile = [image copy];
        [_imgView setImage:_imgFile];
        image = nil;
        cProView.progressValue = 1.0;
        [cProView removeFromSuperview];
    }];
    
    
}


-(void)setUrl:(NSString *)url{
    _url = url;
}

-(void)setUI{
//    16 : 9
    CGFloat tabbarViewH = 49;
    CGFloat shadowViewWSum = Main_Screen_Width - ((Main_Screen_Height - tabbarViewH) / 16 * 9);
    CGFloat shadowViewalpha = 0.3;
    
    CGFloat scollViewContH = Main_Screen_Height - tabbarViewH;
    CGFloat scollViewContW = scollViewContH * (16.0 / 9.0) + shadowViewWSum;
    CGFloat scollViewContX = scollViewContW / 2 - Main_Screen_Width / 2;
    CGFloat scollViewContY = 0;
    
    CGFloat scollViewH = Main_Screen_Height - tabbarViewH;
    CGFloat scollViewW = Main_Screen_Width;
    CGFloat scollViewX = 0;
    CGFloat scollViewY = 0;
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(scollViewX, scollViewY, scollViewW, scollViewH)];
    _scrollView = scrollView;
    scrollView.contentSize = CGSizeMake(scollViewContW, scollViewContH);
    scrollView.contentOffset = CGPointMake(scollViewContX, scollViewContY);
    scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.scrollEnabled = YES;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator  = NO;
    scrollView.decelerationRate = 0;
    _scrollView.delegate = self;
    
    
    CGFloat showViewH = scollViewH;
    CGFloat showViewW = showViewH * 9.0 / 16.0;
    CGFloat showViewX = (Main_Screen_Width - showViewW)/2.0;
    CGFloat showViewY = 0;
    UIImageView * showView = [[UIImageView alloc] initWithFrame:CGRectMake(showViewX, showViewY, showViewW, showViewH)];
    showView.tag = 0;
    [showView setImage:[UIImage imageNamed:@"lockScreemImg.png"]];
    showView.hidden = YES;
    
    _showView = showView;
    
    CGFloat shadowLeftViewH = Main_Screen_Height - tabbarViewH;
    CGFloat shadowLeftViewW = shadowViewWSum/2.0;
    CGFloat shadowLeftViewX = 0;
    CGFloat shadowLeftViewY = 0;
    UIView * shadowLeftView = [[UIView alloc] initWithFrame:CGRectMake(shadowLeftViewX, shadowLeftViewY, shadowLeftViewW, shadowLeftViewH)];
    
    CGFloat shadowRightViewH = Main_Screen_Height - tabbarViewH;
    CGFloat shadowRightViewW = shadowViewWSum/2.0;
    CGFloat shadowRightViewX = GetMaxX(showView);
    CGFloat shadowRightViewY = 0;
    UIView * shadowRightView = [[UIView alloc] initWithFrame:CGRectMake(shadowRightViewX, shadowRightViewY, shadowRightViewW, shadowRightViewH)];
    shadowLeftView.backgroundColor = [UIColor blackColor];
    shadowRightView.backgroundColor = [UIColor blackColor];
    
    shadowLeftView.alpha = shadowViewalpha;
    shadowRightView.alpha = shadowViewalpha;

 
    
    
    CGFloat botViewH = 49;
    CGFloat botViewW = Main_Screen_Width;
    CGFloat botViewX = 0;
    CGFloat botViewY = Main_Screen_Height - botViewH;
    UIView * botView = [[UIView alloc] initWithFrame:CGRectMake(botViewX, botViewY, botViewW, botViewH)];
    _botView = botView;
    botView.backgroundColor = [UIColor blackColor];
    
    
    
    CGFloat btnW = 28;
    CGFloat btnH = 28;
    CGFloat btnY = (botViewH - btnH)/2;
    CGFloat margin = ((Main_Screen_Width - btnW*3)/6.0);
    UIButton * switchBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin, btnY, btnW, btnH)];
    UIButton * showBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin*3 + btnW, btnY, btnW, btnH)];
    UIButton * dowBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin*5 + btnW*2, btnY, btnW, btnH)];
    _switchBtn = switchBtn;
    _showBtn = showBtn;
    _showBtn = dowBtn;
    [switchBtn setBackgroundImage:[UIImage imageNamed:@"swi"] forState:UIControlStateNormal];
    [showBtn setBackgroundImage:[UIImage imageNamed:@"pre"] forState:UIControlStateNormal];
    [dowBtn setBackgroundImage:[UIImage imageNamed:@"dow"] forState:UIControlStateNormal];
    
    [botView addSubview:switchBtn];
    [botView addSubview:showBtn];
    [botView addSubview:dowBtn];
    
    [switchBtn addTarget:self action:@selector(clickSwitchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [showBtn addTarget:self action:@selector(clickShowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [dowBtn addTarget:self action:@selector(clickDowBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    CGFloat imgViewH = scollViewContH;
    CGFloat imgViewW = scollViewContW - shadowViewWSum;
    CGFloat imgViewX = shadowViewWSum/2.0;
    CGFloat imgViewY = 0;
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(imgViewX, imgViewY, imgViewW, imgViewH)];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    _imgView = imgView;
    imgView.userInteractionEnabled = YES;
    
    [self.view addSubview:scrollView];
    [self.view addSubview:botView];
    [self.scrollView addSubview:imgView];
    [self.view addSubview:shadowLeftView];
    [self.view addSubview:shadowRightView];
    [self.view addSubview:showView];
    
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doDoubleTap)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    [self.scrollView addGestureRecognizer:doubleTap];
}

-(void)doDoubleTap{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)clickSwitchBtn:(UIButton *)btn{
   
    if (self.showView.hidden == YES) {
        return;
    }
    if (self.showView.tag == 0) {
        [self.showView setImage:[UIImage imageNamed:@"homeScreamImgW.png"]];
        self.showView.tag = 1;
    }else{
        [self.showView setImage:[UIImage imageNamed:@"lockScreemImg.png"]];
        self.showView.tag = 0;
    }
}
-(void)clickShowBtn:(UIButton *)btn{

   self.showView.hidden = !(self.showView.hidden);
}
-(void)clickDowBtn:(UIButton *)btn{
    UIImageWriteToSavedPhotosAlbum(self.imgView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}



- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error) {
//        [SVProgressHUD showErrorWithStatus:@"保存失败"];
        NSLog(@"save error");
    }else{
        NSLog(@"save success");
//        [SVProgressHUD showSuccessWithStatus:@"保存成功"];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



-(BOOL)prefersStatusBarHidden{
    return YES;
}


-(void)dealloc{
    NSLog(@"die");
}
@end
