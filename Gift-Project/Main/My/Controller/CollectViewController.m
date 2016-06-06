//
//  CollectViewController.m
//  GiftPro
//
//  Created by BeiWo on 16/6/3.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "CollectViewController.h"

@interface CollectViewController ()

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
    
    [self.view addSubview:btn];
    
    btn.backgroundColor = [UIColor cyanColor];
    
    btn.titleLabel.text = @"退出";
    
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchDown];
}

-(void)dismiss{
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"xiaoshi");
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
