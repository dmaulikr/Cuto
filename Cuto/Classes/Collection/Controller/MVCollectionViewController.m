//
//  MVCollectionViewController.m
//  Cuto
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import "MVCollectionViewController.h"
#import "MVCollectionViewFlowLayout.h"
#import "UIView+SDAutoLayout.h"
#import "MVImgCollectionViewCell.h"
#import "VRSNetWorkManager.h"
#import "MVImgModle.h"
#import "MJRefresh.h"

@interface MVCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic , weak)UICollectionView * imgListView;

@property(nonatomic , strong)NSArray * modelArray;
@end

@implementation MVCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCollectionView];
    
    
    self.imgListView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新");
        [self getImgInfoWithNum:5 imgID_Last:0];
        [self.imgListView reloadData];
    }];
    
    self.imgListView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
        NSLog(@"加载更多");
        [self getImgInfoWithNum:10 imgID_Last:0];
        [self.imgListView reloadData];
    }];
    
    [self.imgListView.mj_header beginRefreshing];
}

-(void)endRefresh{
    [self.imgListView.mj_header endRefreshing];
    [self.imgListView.mj_footer endRefreshing];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
}

-(void)getImgInfoWithNum:(NSInteger)num imgID_Last:(NSInteger)imgID{
    NSLog(@"%@",ServerHost);
    
    NSString * url = @"http://mosaicvirus.cn/Cuto/getImg/";
    NSDictionary * header = @{@"num":@(num),@"imgID_Last" : @(imgID)};
    
    
    [VRSNetWorkManager httpRequest:POST url:url parameters:header progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //        NSLog(@"%@" , responseObject);
        NSMutableArray * modelAry = [NSMutableArray array];
        for (NSDictionary * dic  in responseObject) {
            MVImgModle * model = [MVImgModle initWithDict:dic];
            [modelAry addObject:model];
        }

        [self endRefresh];
         self.modelArray = modelAry;
       
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

-(void)setModelArray:(NSArray *)modelArray{
    _modelArray = modelArray;
    [self.imgListView reloadData];
}

- (void)registerCollectionView{
    MVCollectionViewFlowLayout * layout = [[MVCollectionViewFlowLayout alloc] init];
    UICollectionView * imgListView = [[UICollectionView alloc] initWithFrame:Main_Screen_Bounds collectionViewLayout:layout];
    
    _imgListView = imgListView;
    
    [_imgListView registerClass:[MVImgCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _imgListView.collectionViewLayout = layout;
    _imgListView.dataSource = self;
    _imgListView.delegate = self;
    
    [self.view addSubview:_imgListView];
    
    _imgListView.sd_layout.topEqualToView(self.view).offset(20)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view).offset(-50);
    
    
    [self loadViewIfNeeded];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.modelArray.count;
}


- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MVImgCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    MVImgModle * model = [self.modelArray objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)didReceiveMemoryWarning{
    NSLog(@"warning");
}
@end
