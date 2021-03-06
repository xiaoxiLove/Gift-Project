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
#import <MaxLeap/MaxLeap.h>
#import "HotModel.h"
#import "UIImageView+WebCache.h"
#import "DetalViewController.h"


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
    
    NSMutableArray *dataList;//存储男生数据
    
    NSMutableArray *_dataListfemale;//女生数据
    
    NSInteger _selectindex;
    
    HotModel *model;


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
        _selectindex=selectedIndex;
        
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

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self LoadData];
        
    }
    
    return self;
}
//从MaxLeap服务器获取数据
-(void)LoadData
{
    
    //查询语句(查询男生)
    MLQuery *male = [MLQuery queryWithClassName:@"male"];
    
      [male findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        dataList=[[NSMutableArray alloc]init];
        
        for (NSInteger i = 0; i<objects.count ; i++ ) {
            
            model=[[HotModel alloc]init];
            
            MLObject *myObject = objects[i];
            
            model.giftName=myObject[@"GiftName"];
            
            model.giftPrice=myObject[@"Price"];
            
            model.giftDetail=myObject[@"giftDetail"];
            
            model.imageurl=myObject[@"ImageUrl"];
            
            model.array=myObject[@"ImageUrlArray"];
            
            [dataList addObject:model];
            
        }
    }];
    
    
    //查询女生
    MLQuery *female = [MLQuery queryWithClassName:@"female"];
    
    [female findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        _dataListfemale=[[NSMutableArray alloc]init];
        
        for (NSInteger i = 0; i<objects.count ; i++ ) {
            
            HotModel *modelFemale=[[HotModel alloc]init];
            
            MLObject *myObject = objects[i];
            
            modelFemale.giftName=myObject[@"GiftName"];
            
            modelFemale.giftPrice=myObject[@"Price"];
            
            model.giftDetail=myObject[@"giftDetail"];
            
            modelFemale.imageurl=myObject[@"ImageUrl"];
            
            modelFemale.array=myObject[@"ImageUrlArray"];
            
            [_dataListfemale addObject:modelFemale];
            
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
    
    layout.itemSize=CGSizeMake((kScreenWidth-30)/2.0, (kScreenHeight-40)/3.0);
    
    layout.minimumLineSpacing = 10;
    
    layout.minimumInteritemSpacing = 1;
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) collectionViewLayout:layout];
    
    collectionView.backgroundColor=[UIColor lightGrayColor];
    
    collectionView.delegate = self;
    
    collectionView.dataSource = self;
    
    collectionView.showsVerticalScrollIndicator=NO;
    
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cell_identy];
    
}


#pragma mark --UICollectionViewDataSource

//返回item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}
//返回单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(_selectindex==0)
    {
        model = dataList[indexPath.row];

    }else
    {
        model = _dataListfemale[indexPath.row];
    }
    
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_identy forIndexPath:indexPath];
    
    //处理单元格复用问题
    for(UIImageView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    
    cell.backgroundColor=[UIColor whiteColor];
    
    imgV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height-20)];
    
    
    [imgV setImageWithURL:[NSURL URLWithString:model.imageurl]];
    
    [cell addSubview:imgV];
    
    pricelbl=[[UILabel alloc]initWithFrame:CGRectMake(0, cell.bounds.size.height-20, cell.bounds.size.width-20, 20)];
    
    pricelbl.text= [NSString stringWithFormat:@"￥%@",model.giftPrice];
    
    pricelbl.textColor=[UIColor redColor];
    
    [cell addSubview:pricelbl];
    
    collect=[[UIImageView alloc]initWithFrame:CGRectMake(cell.bounds.size.width-70, cell.bounds.size.height-20, 20, 20)];
    
    collect.image=[UIImage imageNamed:@"21"];
    
    [cell addSubview:collect];
    
    numberlbl=[[UILabel alloc]initWithFrame:CGRectMake(cell.bounds.size.width-50, cell.bounds.size.height-20, 40, 20)];
    
    numberlbl.text=[NSString stringWithFormat:@"%@",model.giftPrice];
    
    numberlbl.textColor=[UIColor lightGrayColor];
    
    [cell addSubview:numberlbl];
    
        
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout

//边缘大小
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 13, 10);
    
}

//点击弹出详情
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HotModel *Selectmodel=[[HotModel alloc]init];

    if(_selectindex==0)
    {
        Selectmodel=dataList[indexPath.row];
        
    }else if(_selectindex==1)
    {
        Selectmodel=dataList[indexPath.row];
    }
    
    DetalViewController *DetailVC=[[DetalViewController alloc]init];
    
    DetailVC.model=Selectmodel;
    
    [self.navigationController pushViewController:DetailVC animated:YES];
    
    _segment.hidden=YES;
    
}



@end
