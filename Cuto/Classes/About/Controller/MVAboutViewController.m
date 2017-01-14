//
//  MVAboutViewController.m
//  Cuto
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import "MVAboutViewController.h"
#import "UIImageView+WebCache.h"
#import <SafariServices/SafariServices.h>


@interface MVAboutViewController ()

@property(weak,nonatomic)UIVisualEffectView * mView;

@end




@implementation MVAboutViewController

@synthesize name = _name;



- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUI];
    
}

-(void)setUI{
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:Main_Screen_Bounds];
    imgView.image = [UIImage imageNamed:@"aboutBackImg.png"];
    UIBlurEffect * bef = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView * vefView = [[UIVisualEffectView alloc] initWithEffect:bef];
    vefView.frame = Main_Screen_Bounds;
    vefView.alpha = 0.88;
    [imgView addSubview:vefView];
    NSLog(@"MMMMM");
    //    [self.view addSubview:imgView];
    self.tableView.backgroundView = imgView;
    //    [self.tableView.backgroundView addSubview:imgView];
    //        childVc.edgesForExtendedLayout = UIRectEdgeNone;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.section);
    // 0 -4
    NSInteger num = [indexPath section];
    switch (num) {
        case 0:
            [self donation];
            break;
        case 1:
            [self showAFQ];
            break;
        case 2:
            [self shreadApp];
            break;
        case 3:
            [self goAppStore];
            break;
        case 4:
            [self takeInfo];
            break;
        default:
            break;
    }
}
/// 捐赠
-(void)donation{

}


/// AFQ
-(void)showAFQ{
    NSURL * url = [NSURL URLWithString:@"http://sspai.com/topic/cuto_ios_faq/"];
    SFSafariViewController * sfvc = [[SFSafariViewController alloc] initWithURL:url];
    [self presentViewController:sfvc animated:YES completion:nil];
}


/// 分享
-(void)shreadApp{
    UIPasteboard * psb = [UIPasteboard generalPasteboard];
    [psb setString:@"123456"];

    
    UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:@[@"icon", [[NSBundle mainBundle] URLForResource:@"icon" withExtension:@"png"]] applicationActivities:nil];
    [self.navigationController pushViewController:activity animated:YES];

}

/// 去评论
-(void)goAppStore{
    
}

/// 反馈
-(void)takeInfo{

}

@end
