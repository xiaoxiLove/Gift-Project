//
//  LeftViewController.m
//  Gift-Project
//
//  Created by Honey on 16/6/2.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "LeftViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 200, kScreenH)];
    
    tableView.dataSource = self;
    
    tableView.delegate = self;
    
    
    [self.view addSubview:tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        cell.backgroundColor = [UIColor brownColor];
    }
    
    switch (indexPath.row) {
        case 0:
    cell.textLabel.text = @"送.男票";
            break;
        case 1:
            cell.textLabel.text = @"送.闺蜜";
            break;
        case 2:
            cell.textLabel.text = @"送.同事";
            break;
        case 3:
            cell.textLabel.text = @"送.朋友";
            break;
        case 4:
            cell.textLabel.text = @"送.爸妈";
            break;
        case 5:
            cell.textLabel.text = @"送.基友";
            break;

            
        default:
            break;
    }


    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];

        cell.accessoryType = UITableViewCellAccessoryNone;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    if(cell)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
