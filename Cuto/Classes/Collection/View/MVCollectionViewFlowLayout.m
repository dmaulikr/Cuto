//
//  MVCollectionViewFlowLayout.m
//  Cuto
//
//  Created by apple on 16/11/17.
//  Copyright © 2016年 MosaciVirus. All rights reserved.
//

#import "MVCollectionViewFlowLayout.h"

#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.5


@implementation MVCollectionViewFlowLayout

-(instancetype)init{
    if (self = [super init]) {
        
        self.itemSize = CGSizeMake(Main_Screen_Width, ([UIScreen mainScreen].bounds.size.width) * (9.0 / 16.0));
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.minimumLineSpacing = 0;
//        self.springinessenabled = false;
//        collectionviewlayout.springinessenabled = false。
    }
    return self;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    // 返回YES表示需要重新布局
    return YES;
}

// 该方法的返回值控制指定CGRect区域内各单元格的大小、位置等布局属性
- ( NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray* original = [super layoutAttributesForElementsInRect:rect];
    NSArray * array = [[NSArray alloc] initWithArray:original copyItems:YES];
    CGFloat centerY = self.collectionView.contentOffset.y + (GetHeigh(self.collectionView) / 2);
    int i = 1 ;
    for (UICollectionViewLayoutAttributes * attrs in array) {
        CGFloat delta = ABS(attrs.center.y - centerY);
        CGFloat scale = 1 - delta/GetHeigh(self.collectionView);
//        NSLog(@"(%d)【%f】" ,i,scale);
        i++;
        if (scale > 0) {
            scale += 0.33;
        }else if (scale < 0){
            scale -= 0.33 ;
        }
        if (scale > 1) {
            scale =1;
        }else if (scale < -1){
            scale = -1 ;
        }
//        NSLog(@"[==%f]" ,scale);
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return array;
}
@end
