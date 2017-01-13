//
//  MVAboutViewController.m
//  Cuto
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import "MVAboutViewController.h"
#import "UIImageView+WebCache.h"



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



@end
