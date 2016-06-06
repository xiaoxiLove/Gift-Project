//
//  MyViewController.m
//  Gift-Project
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "MyViewController.h"
#import "DetailViewController.h"
#import "ThemeViewController.h"
#import "CollectViewController.h"
#import "OurViewController.h"
#import "RelationViewController.h"
#import "UpdataViewController.h"
#import "QuitViewController.h"
#import "LoginViewController.h"
#import "DetailModel.h"
#import <Maxleap/MaxLeap.h>
#import "AFNCore.h"



@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_tableView;
    
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,  self.view.bounds.size.height)];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    [self loadData];
}
-(void)loadData{

    
    

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        
        cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 150)];
        
        //        cell.backgroundColor = [UIColor redColor];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 10, 80, 80)];
        
        [btn setImage:[UIImage imageNamed:@"123.jpg"] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(detail) forControlEvents:UIControlEventTouchDown];
        
        //        btn.imageView.image = [UIImage imageNamed:@"123.png"];
        
        //        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 10, 80, 80)];
        
        btn.imageView.layer.cornerRadius = 40;
        
        btn.imageView.layer.masksToBounds = YES;
        
        //        imageView.image = [UIImage imageNamed:@"123.png"];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(180, 40, 160, 50)];
        
        label.backgroundColor = [UIColor yellowColor];
        
        label.text = @"我是弟弟";
        
        label.textAlignment = NSTextAlignmentCenter;
        
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(220, 100, 40, 40)];
        
        imageView1.layer.cornerRadius = 20;
        
        imageView1.layer.masksToBounds = YES;
        
        imageView1.image = [UIImage imageNamed:@"456.jpg"];
        
        cell.backgroundColor = [UIColor greenColor];
        
        cell.layer.cornerRadius = 20;
        
        cell.layer.masksToBounds = YES;
        
        [cell addSubview:imageView1];
        
        
        [cell addSubview:label];
        
        [cell addSubview:btn];
        
//        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell_bg.jpg"]];
    }
    
    else{
        
        cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 150, kScreenW, (kScreenH - 263)/6)];
        
        cell.backgroundColor = [UIColor cyanColor];
        
        cell.layer.cornerRadius = 20;
        
        cell.layer.masksToBounds = YES;
        
        
        
    }
    
    switch (indexPath.row) {
        case 1:
            cell.textLabel.text = @"主题切换";
            break;
        case 2:
            cell.textLabel.text = @"我的收藏";
            
            break;
        case 3:
            cell.textLabel.text = @"关于我们";
            
            break;
        case 4:
            cell.textLabel.text = @"联系客服";
            
            break;
        case 5:
            cell.textLabel.text = @"版本更新";
            
            break;
        case 6:
            cell.textLabel.text = @"退出";
            
            break;
            
        default:
            break;
    }
    
    return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 0) {
        return 150;
    }
    return (kScreenH - 263)/6;
    
    
    
}

-(void)detail{
    

    
//    MLUser *user = [MLUser user];
    
    MLUser *user =  (MLUser *)[MLUser currentUser];
    
    
 
    
    

    DetailModel *model = [[DetailModel alloc]init];
    
    model.username = user[@"username"];
    
    model.date = user[@"lastLoginTime"];
    
    
    
    
    

    if (!user) {
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        
        [self presentViewController:loginVC animated:YES completion:nil];
    }else{
    

        DetailViewController *detail = [[DetailViewController alloc]init];
    
        [self presentViewController:detail animated:YES completion:^{
    
            NSLog(@"弹出");
        }];
    }

    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSArray *arr = @[@"ThemeViewController",@"CollectViewController",@"OurViewController",@"RelationViewController",@"UpdataViewController",@"QuitViewController"];
    
    if (indexPath.row == 0) {
        return;
    }
    
    
    UIViewController *vc = [[NSClassFromString(arr[indexPath.row - 1]) alloc]init];
    
    [self presentViewController:vc animated:YES completion:^{
        NSLog(@"123");
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
