//
//  LoginViewController.m
//  Gift-Project
//
//  Created by mac on 16/6/2.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "LoginViewController.h"
#import <MaxLeap/MaxLeap.h>
#import "AFNCore.h"
#import "MyViewController.h"
#import "RegisterViewController.h"


@interface LoginViewController ()
{
    UITextField *emailField;
    
    UITextField *passField;
}

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
    
    //设置登录界面输入邮箱框的图片
    UIImageView *ivEmail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 272, 50)];
    
    ivEmail.center = CGPointMake(kScreenW/2, kScreenH/3);
    
    ivEmail.image = [UIImage imageNamed:@"login_message"];
    
    [self.view addSubview:ivEmail];
    
    //设置登录界面输入的手机框
    emailField = [[UITextField alloc]initWithFrame:CGRectMake(40, 0, 200, 50)];
    
    emailField.center = CGPointMake(kScreenW/1.9, kScreenH/3);
    
    emailField.placeholder = @"请输入邮箱";
    
    emailField.keyboardType = UIKeyboardTypeEmailAddress;
    
    [self.view addSubview:emailField];
    
    //设置登录界面输入密码的图片
    UIImageView *ivPass = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 272, 50)];
    
    ivPass.center = CGPointMake(kScreenW/2, kScreenH/2.3);
    
    ivPass.image = [UIImage imageNamed:@"login_password"];
    
    [self.view addSubview:ivPass];
    
    //设置登录界面输入的密码框
    passField = [[UITextField alloc]initWithFrame:CGRectMake(40, 0, 200, 50)];
    
    passField.center = CGPointMake(kScreenW/1.9, kScreenH/2.3);
    
    passField.placeholder = @"请输入密码";
    
    passField.secureTextEntry = YES;
    
    passField.keyboardType = UIKeyboardTypeDefault;
    
    [self.view addSubview:passField];
    
    //设置登录界面登录按钮的图片
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 35)];
    
    [loginBtn setTitle:@"" forState:UIControlStateNormal];
    
    [loginBtn setImage:[UIImage imageNamed:@"login_button"] forState:UIControlStateNormal];
    
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
    loginBtn.center = CGPointMake(kScreenW/3.2, kScreenH/1.8);
    
    [self.view addSubview:loginBtn];
    
    //设置登录界面注册按钮的图片
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 35)];
    
    [registerBtn setTitle:@"" forState:UIControlStateNormal];
    
    [registerBtn setImage:[UIImage imageNamed:@"register_button"] forState:UIControlStateNormal];
    
    [registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    
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

//利用正则表达式验证
- (BOOL)isValidateEmail:(NSString *)email {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
}

- (void)alertWithTitle:(NSString *)title withMessage:(NSString *)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

//登录按钮实现
- (void)loginAction{
    
    if (emailField.text.length == 0) {
        
        [self alertWithTitle:@"登录失败" withMessage:@"邮箱不能为空"];
        
    }else if (passField.text.length<6 || passField.text.length>12 ){
        
        [self alertWithTitle:@"登录失败" withMessage:@"密码长度必须为6-12位"];
        
    }else if (![self isValidateEmail:emailField.text]) {
        
        [self alertWithTitle:@"登录失败" withMessage:@"邮箱不正确"];
        
    }else{
        
        [AFNCore loginByEmail:emailField.text byPassword:passField.text byMyBlock:^(id result) {
            
            if ([(NSString *)result isEqualToString:@"登录成功"]){
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录成功" message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    
                    MyViewController *myVC = [[MyViewController alloc]init];
                    
                    [self presentViewController:myVC animated:YES completion:nil];
                    
                }];
                
                [alert addAction:action];
                
                [self presentViewController:alert animated:YES completion:nil];
                
            }else{
                
                [self alertWithTitle:@"登录失败" withMessage:result];
                
            }
        }];
    }
}

- (void)registerAction{
    
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    
    [self presentViewController:registerVC animated:YES completion:nil];
    
}


@end
