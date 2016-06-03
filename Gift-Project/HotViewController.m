//
//  HotViewController.m
//  Gift-Project
//
//  Created by Honey on 16/6/2.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "HotViewController.h"
#import "SegmentView.h"
#import "MJRefresh.h"


@interface HotViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
    SegmentView *_segment;
    
    UICollectionView *collectionView;
    
    UICollectionViewCell *cell;
    
    UIColor *color;
    
    UIImageView*imgV;//礼物图片
    
    UILabel*pricelbl;//价格
    
    UIImageView*collect;//收藏图片
    
    UILabel*numberlbl;//收藏人数

}

@end


@implementation HotViewController

static NSString *cell_identy = @"cell";

/**
 *  分类主界面
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    color = [UIColor cyanColor];
   
    self.view.backgroundColor=[UIColor whiteColor];
    
    _segment = [[SegmentView alloc]initWithFrame:CGRectMake(50, 20, kScreenWidth-100, 40) titles:@[@"男生专区",@"女生专区"]];
    
    _segment.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navbg.png"]];

    [self.navigationController.view addSubview:_segment];
    
    [self LoadCollectionView];
    
    //按钮点击方法
    [_segment segmentViewButtonClick:^(NSInteger selectedIndex)
    {
        
        if(selectedIndex==0)
        {
            color = [UIColor cyanColor];
            
            [self LoadCollectionView];

        }else if(selectedIndex==1)
        {
            color = [UIColor redColor];
            
            [self LoadCollectionView];
        }
        
    }];
    
}
//刷新

-(void)setupRefresh
{
   
}

-(void)LoadCollectionView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize=CGSizeMake((kScreenWidth-40)/2.0, (kScreenHeight-40)/3.0);
    
    layout.minimumLineSpacing = 20;
    
    layout.minimumInteritemSpacing = 1;
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;

    collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) collectionViewLayout:layout];
    
    collectionView.backgroundColor=[UIColor lightGrayColor];
    
    collectionView.delegate = self;
    
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cell_identy];
    
}

#pragma mark --UICollectionViewDataSource

//返回item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 30;
}
//返回单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //✅使用注册单元格
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_identy forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];

    return cell;
    
}
#pragma mark --UICollectionViewDelegateFlowLayout

//边缘大小
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}

//点击弹出详情
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
