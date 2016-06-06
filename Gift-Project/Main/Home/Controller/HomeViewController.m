//
//  HomeViewController.m
//  Gift-Project
//
//  Created by Beiwo on 16/6/2.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewLayout.h"
#import "HomeModel.h"
#import "UIViewExt.h"
#import <MaxLeap/MaxLeap.h>//数据库框架
#import "UIImageView+WebCache.h"
#import "HomeDetailViewController.h"//弹出视图


@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableArray *_HDataList;//数组
    
    UIImageView *_HImgView;//图片
    
    UILabel *_HLabel;//评价
}
@end

@implementation HomeViewController


static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self reloadData];
    
    
        
}

//加载数据
- (void)reloadData
{
    //查询语句
    MLQuery *query = [MLQuery queryWithClassName:@"gift"];
    
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        _HDataList = [[NSMutableArray alloc]init];
        
        for (NSInteger i = 0; i<objects.count ; i++ ) {
            
            HomeModel *model=[[HomeModel alloc]init];
            
            MLObject *myObject = objects[i];
            
//            model.giftName = myObject[@"giftName"];
            
            model.giftOutline = myObject[@"giftOutline"];//简介
            
//            model.giftPrice=myObject[@"giftPrice"];
//            
//            model.giftDetail=myObject[@"giftDetail"];
//            
            model.Url = myObject[@"Url"];
            
            [_HDataList addObject:model];

        }
        
        [self creatCollectionView];//创建collectionView 不要在for循环里面创建

        
    }];
}

-(void)creatCollectionView{
    
    //设置布局类
    HomeCollectionViewLayout *layout = [[HomeCollectionViewLayout alloc]init];
    
    //创建collectiongView
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    collectionView.dataSource = self;
    
    collectionView.delegate = self;
    
//    _collectionView.userInteractionEnabled = YES;
    
    collectionView.backgroundColor = [UIColor clearColor];
    
    //注册单元格
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    [self.view addSubview:collectionView];
}

#define mark ---------------  UITabelViewCell
//返回组个数
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}

//返回单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

//返回单元格内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    UICollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    //复用问题
    for (UIView *view in cell.subviews) {
        
        [view removeFromSuperview];
    }
    
    //如果有就不创建  没有就创建
    if (!cell) {
        
        cell = [[UICollectionViewCell alloc]init];
        
    }
    
    [self creatCellSubviews:cell IndexPath:indexPath];

    return cell;

}

//cell里面的数据
-(void)creatCellSubviews:(UICollectionViewCell *)cell IndexPath:(NSIndexPath *)indexPath{
    
    cell.backgroundColor = [UIColor clearColor];
    
    //把datalist放入model里面
    HomeModel *model = _HDataList[indexPath.row];
    
    //添加图片
    _HImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.width, cell.height -40)];
    
    [_HImgView setImageWithURL:[NSURL URLWithString:model.Url]];
    
    NSLog(@"%@",model.Url);
    
    [cell addSubview:_HImgView];
    
    //添加评价
    _HLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, cell.height -40, cell.width, 30)];
    
    _HLabel.text = model.giftOutline;
    
    _HLabel.textColor = [UIColor blackColor];
    
    _HLabel.font = [UIFont fontWithName:@"Iowan Old Style" size:13];//字体和字号
    
    _HLabel.numberOfLines = 0;//是否换行
    
    [_HLabel sizeToFit];//尺寸自适应
    
    [cell addSubview:_HLabel];
    
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //返回单元格高度
//    return 240;
//}

//点击单元格. 推出详情视图
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
//{
//    HomeDetailViewController *detailVC = [[HomeDetailViewController alloc]init];
//    
////    detailVC.model = _HDataList[indexPath.row];
//    
//    [self.navigationController pushViewController:detailVC animated:YES];
//    
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        HomeDetailViewController *detailVC = [[HomeDetailViewController alloc]init];
    
    //    detailVC.model = _HDataList[indexPath.row];
    
        [self.navigationController pushViewController:detailVC animated:YES];

}


@end
