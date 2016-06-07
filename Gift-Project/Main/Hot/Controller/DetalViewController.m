//
//  DetalViewController.m
//  Gift-Project
//
//  Created by Honey on 16/6/4.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "DetalViewController.h"
#import "UIImageView+WebCache.h"

@interface DetalViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    
    UITableView *_tableView;//内容视图
    
    UIImageView *_headImg;//头部滑动视图图片
    
    UIScrollView *_scrollView;
    
    UIImageView *_cellImgView;//单元格图片
    
    NSArray *_arrayImgUrl;//图片数组
    
    CGFloat _imageHeight;//数组图片高度
    
    NSInteger _index;//记录图片下标
    
    
    
    
}


@end

@implementation DetalViewController

-(void)setModel:(HotModel *)model
{
    _model=model;
    
    _arrayImgUrl=[[NSArray alloc]init];
    
    _arrayImgUrl=_model.array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self LoadTableView];
    
    UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
}


-(void)backBtnClick:(UIButton *)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//
-(void)LoadTableView
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    
    _tableView.delegate=self;
    
    _tableView.dataSource=self;
    
    _tableView.separatorStyle=UITableViewCellSelectionStyleNone;
    
    //设置头视图
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 300)];
    
    _scrollView.contentSize = CGSizeMake(3 * kScreenW, 300);
    
    _scrollView.bounces=YES;
    
    _scrollView.delegate=self;
    
    
    for (int i=0; i<3; i++) {
        
        
        //        NSURL *url=_arrayImgUrl[i];
        //
        //        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",url]];
        //
        //        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        
        NSLog(@"%@",_arrayImgUrl);
        
        [_headImg setImageWithURL:[NSURL URLWithString:_arrayImgUrl[i]]];
        
        _headImg.frame = CGRectMake(i * kScreenW, 0, kScreenW, 300);
        
        [_scrollView addSubview:_headImg];
        
    }
    
    _index=0;
    
    //设置图片轮播时间
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(star:) userInfo:nil repeats:YES];
    
    _tableView.tableHeaderView=_scrollView;
    
    
    [self.view addSubview:_tableView];
    
}

//设置计时器
-(void)star:(NSTimer*)timer
{
    UIScrollView *sv=_scrollView;
    
    //根据图片下标重新设置偏移量
    [sv setContentOffset:CGPointMake((_index*kScreenW), 0) animated:YES];
    _index++;
    if(_index==9)
    {
        _index=0;
    }
    
}

#pragma mark--------UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"font_cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    //    //处理单元格复用问题
    //    for(UIView *view in cell.subviews) {
    //        [view removeFromSuperview];
    //    }
    //
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    switch (indexPath.row) {
        case 0:
            
            cell.textLabel.text=_model.giftName;
            break;
            
        case 1:
            
            cell.textLabel.text=[NSString stringWithFormat:@"￥%@",_model.giftPrice];
            
            
            break;
            
        case 2:
            cell.textLabel.numberOfLines=0;
            
            cell.textLabel.text=_model.giftDetail;
            break;
            
        case 3:
            
            
            for (int i=0; i<_arrayImgUrl.count;i++) {
                
                UIImageView *cellIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, i*400, kScreenW, 400)];
                
                [cellIV setImageWithURL:[NSURL URLWithString:_arrayImgUrl[i]]];
                
                [cell addSubview:cellIV];
            }
            
            _imageHeight = (CGFloat)_arrayImgUrl.count * 400 +64;
            
            break;
            
        default:
            break;
    }
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
            
        case 0:
            return 30;
            break;
            
        case 1:
            return 30;
            break;
            
        case 2:
            return 70;
            break;
            
        case 3:
            return _imageHeight;
            break;
            
        default:
            break;
    }
    
    return 0;
}






@end
