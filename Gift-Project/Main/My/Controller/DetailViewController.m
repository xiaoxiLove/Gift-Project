//
//  DetailViewController.m
//  Gift-Project
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "DetailViewController.h"



@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH)];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
    
    [self.view addSubview:btn];
    

    
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    
    btn.titleLabel.text = @"退出";
    
    btn.titleLabel.text = @"退出";
    
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchDown];

    
    
}

-(void)setModel:(DetailModel *)model{
    
    model = _model;
}

-(void)dismiss{
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"xiaoshi");
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identy = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identy];
        
        
    }
    
//    cell.backgroundColor = [UIColor cyanColor];
    
    cell.textLabel.text = _model.username;
    
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    return (kScreenH - 100)/5;

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
