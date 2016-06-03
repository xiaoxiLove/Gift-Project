//
//  LoginViewController.m
//  Gift-Project
//
//  Created by mac on 16/6/2.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置登录界面背景图片
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_backgroud"]];
    
    //设置登录界面logo图片
    UIImageView *ivLogo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 272, 400)];
    
    ivLogo.center = CGPointMake(kScreenW/2, kScreenH/5);
    
    ivLogo.image = [UIImage imageNamed:@"login_logo"];
    
    [self.view addSubview:ivLogo];
    
    //设置登录界面输入手机框的图片
    UIImageView *ivTel = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 272, 50)];
    
    ivTel.center = CGPointMake(kScreenW/2, kScreenH/3);
    
    ivTel.image = [UIImage imageNamed:@"login_tel"];
    
    [self.view addSubview:ivTel];
    
    //设置登录界面输入的手机框
    UITextField *telField = [[UITextField alloc]initWithFrame:CGRectMake(40, 0, 200, 50)];
    
    telField.center = CGPointMake(kScreenW/1.9, kScreenH/3);
    
    telField.placeholder = @"请输入手机号";
    
    telField.keyboardType = UIKeyboardTypePhonePad;
    
    [self.view addSubview:telField];
    
    //设置登录界面输入密码的图片
    UIImageView *ivPass = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 272, 50)];
    
    ivPass.center = CGPointMake(kScreenW/2, kScreenH/2.3);
    
    ivPass.image = [UIImage imageNamed:@"login_password"];
    
    [self.view addSubview:ivPass];
    
    //设置登录界面输入的密码框
    UITextField *passField = [[UITextField alloc]initWithFrame:CGRectMake(40, 0, 200, 50)];
    
    passField.center = CGPointMake(kScreenW/1.9, kScreenH/2.3);
    
    passField.placeholder = @"请输入密码";
    
    passField.keyboardType = UIKeyboardTypeDefault;
    
    [self.view addSubview:passField];
    
    //设置登录界面登录按钮的图片
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 35)];
    
    [loginBtn setTitle:@"" forState:UIControlStateNormal];
    
    [loginBtn setImage:[UIImage imageNamed:@"login_button"] forState:UIControlStateNormal];
    
    loginBtn.center = CGPointMake(kScreenW/3.2, kScreenH/1.8);
    
    [self.view addSubview:loginBtn];
    
    //设置登录界面注册按钮的图片
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 35)];
    
    [registerBtn setTitle:@"" forState:UIControlStateNormal];
    
    [registerBtn setImage:[UIImage imageNamed:@"register_button"] forState:UIControlStateNormal];
    
    registerBtn.center = CGPointMake(kScreenW/1.5, kScreenH/1.8);
    
    [self.view addSubview:registerBtn];
    
    //设置登录界面辅助图片
    UIImageView *ivPoint = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 100)];
    
    ivPoint.center = CGPointMake(kScreenW/2, kScreenH/1.4);
    
    ivPoint.image = [UIImage imageNamed:@"login_point"];
    
    [self.view addSubview:ivPoint];
    
    UIImageView *ivLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    
    ivLine.center = CGPointMake(kScreenW/2, kScreenH/1.2);
    
    ivLine.image = [UIImage imageNamed:@"login_line"];
    
    [self.view addSubview:ivLine];
    
    //设置登录界面使用游客身份浏览
    UIButton *randomLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 35)];
    
    [randomLoginBtn setTitle:@"使用游客身份浏览" forState:UIControlStateNormal];
    
    //    [randomLoginBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    randomLoginBtn.center = CGPointMake(kScreenW/2, kScreenH/1.1);
    
    [self.view addSubview:randomLoginBtn];
    
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
