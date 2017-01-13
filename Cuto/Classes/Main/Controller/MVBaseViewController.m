//
//  MVBaseViewController.m
//  Cuto
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import "MVBaseViewController.h"
#import "MVCollectionViewController.h"
#import "MVAboutViewController.h"

@interface MVBaseViewController ()
@property(nonatomic , assign) UIView * botView;
@end

@implementation MVBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MVCollectionViewController * mainVC = [MVCollectionViewController new];
    MVCollectionViewController * collVC = [MVCollectionViewController new];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MVAboutViewController" bundle:nil];
//    MVAbtTableViewController * aboutVC = [sb instantiateInitialViewController];
    MVAboutViewController * aboutVC = [sb instantiateInitialViewController];

    self.viewControllers = @[mainVC , collVC , aboutVC];
    
    CGFloat botViewH = 49;
    UIView * botView = [[UIView alloc] initWithFrame:CGRectMake(0, Main_Screen_Height - botViewH, Main_Screen_Width, botViewH)];
    botView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:botView];
    
    _botView = botView;
    
    CGFloat btnW = 28;
    CGFloat btnH = 28;
    CGFloat btnY = (botViewH - btnH)/2;
    CGFloat margin = ((Main_Screen_Width - btnW*3)/6.0);
    
    
    UIButton * homeBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin, btnY, btnW, btnH)];
    UIButton * shouCangBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin*3 + btnW, btnY, btnW, btnH)];
    UIButton * aboutBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin*5 + btnW*2, btnY, btnW, btnH)];
    homeBtn.tag = 0;
    shouCangBtn.tag = 1;
    aboutBtn.tag = 2;
    [_botView addSubview:homeBtn];
    [_botView addSubview:shouCangBtn];
    [_botView addSubview:aboutBtn];
    
    
    
    [homeBtn setBackgroundImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [shouCangBtn setBackgroundImage:[UIImage imageNamed:@"collection.png"] forState:UIControlStateNormal];
    [aboutBtn setBackgroundImage:[UIImage imageNamed:@"setting.png"] forState:UIControlStateNormal];
    
    [homeBtn setBackgroundImage:[UIImage imageNamed:@"home_select.png"] forState:UIControlStateHighlighted];
    [shouCangBtn setBackgroundImage:[UIImage imageNamed:@"collection_select.png"] forState:UIControlStateHighlighted];
    [aboutBtn setBackgroundImage:[UIImage imageNamed:@"setting_select.png"] forState:UIControlStateHighlighted];
    
    [homeBtn setBackgroundImage:[UIImage imageNamed:@"home_select.png"] forState:UIControlStateSelected];
    [shouCangBtn setBackgroundImage:[UIImage imageNamed:@"collection_select.png"] forState:UIControlStateSelected];
    [aboutBtn setBackgroundImage:[UIImage imageNamed:@"setting_select.png"] forState:UIControlStateSelected];
    
    [homeBtn addTarget:self action:@selector(clickHomeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [shouCangBtn addTarget:self action:@selector(clickShouCangBtn:) forControlEvents:UIControlEventTouchUpInside];
    [aboutBtn addTarget:self action:@selector(clickAboutBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
   
    
}

-(void)clickHomeBtn:(UIButton *)sender{
    [self setSelectedIndex:0];
    [self changeBtnStatement:0];
}
-(void)clickShouCangBtn:(UIButton *)sender{
    [self setSelectedIndex:1];
    [self changeBtnStatement:1];
    
}
-(void)clickAboutBtn:(UIButton *)sender{
    [self setSelectedIndex:2];
    [self changeBtnStatement:2];
}

-(void)changeBtnStatement:(NSInteger)index{
    NSArray * array = [_botView subviews];
    for (id btn in array) {
        if ([btn isKindOfClass:[UIButton class]]) {
            [btn setSelected:([btn tag] == index)];
        }
    }
}
@end
