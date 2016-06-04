//
//  OurViewController.m
//  GiftPro
//
//  Created by BeiWo on 16/6/3.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "OurViewController.h"

@interface OurViewController ()

@end

@implementation OurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 120, 120, 72)];
    
    ImgView.image = [UIImage imageNamed:@"gift.jpg"];
    
    [self.view addSubview:ImgView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(145, 220, 180, 50)];
    
    label.text = @"礼上网来（1.0.0）";
    
    [self.view addSubview:label];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreenH - 100, kScreenW, 100)];
    
    lab.textAlignment = NSTextAlignmentCenter;
    
    lab.text = @"南山南.北秋北";
    
    [self.view addSubview:lab];
    
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
    
    [self.view addSubview:btn];
    

    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    
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
