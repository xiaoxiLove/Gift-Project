//
//  HomeDetailViewController.m
//  Gift-Project
//
//  Created by Beiwo on 16/6/6.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "HomeDetailViewController.h"

@interface HomeDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createSubviews];//创建视图
}

- (void)createSubviews
{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    
    _tableView.backgroundColor = [UIColor greenColor];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
}

#define mark --------------- UITableView
//单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
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
