//
//  RegisterViewController.m
//  Gift-Project
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "RegisterViewController.h"
#import <MaxLeap/MaxLeap.h>
#import "AFNCore.h"
#import "LoginViewController.h"

@interface RegisterViewController ()
{
    UITextField *emailField;
    
    UITextField *passField;
    
    UITextField *surePassField;

    
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置注册界面的背景图片
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"register_backgroud"]];
    
    //设置注册界面的欢迎文字
    UIImageView *ivWelcome = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 120)];
    
    ivWelcome.image = [UIImage imageNamed:@"register_welcome"];
    
    ivWelcome.center = CGPointMake(kScreenW/2, kScreenH/5);
    
    [self.view addSubview:ivWelcome];
    
    //设置注册界面的手机输入框的图片
    UIImageView *ivEmail = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 272, 40)];
    
    ivEmail.image = [UIImage imageNamed:@"register_message"];
    
    ivEmail.center = CGPointMake(kScreenW/2, kScreenH/3);
    
    [self.view addSubview:ivEmail];
    
    //设置注册界面输入的邮箱框
    emailField = [[UITextField alloc]initWithFrame:CGRectMake(40, 0, 270, 50)];
    
    emailField.center = CGPointMake(kScreenW/1.6, kScreenH/3);
    
    emailField.placeholder = @"请输入邮箱";
    
    emailField.keyboardType = UIKeyboardTypePhonePad;
    
    [self.view addSubview:emailField];
    
    //设置注册界面的性别选择的图片
    UIImageView *ivSex = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 272, 40)];
    
    ivSex.image = [UIImage imageNamed:@"register_message"];
    
    ivSex.center = CGPointMake(kScreenW/2, kScreenH/2.3);
    
    [self.view addSubview:ivSex];
    
    //设置注册界面的密码输入框的图片
    UIImageView *ivPass = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 272, 40)];
    
    ivPass.image = [UIImage imageNamed:@"register_password"];
    
    ivPass.center = CGPointMake(kScreenW/2, kScreenH/1.9);
    
    [self.view addSubview:ivPass];
    
    //设置注册界面输入的密码框
    passField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    
    passField.center = CGPointMake(kScreenW/2.1, kScreenH/1.9);
    
    passField.placeholder = @"请输入密码";
    
    //设置密码形式
    passField.secureTextEntry = YES;
    
    passField.keyboardType = UIKeyboardTypeDefault;
    
    [self.view addSubview:passField];
    
    //设置注册界面的确认密码输入框的图片
    UIImageView *ivSurePass = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 272, 40)];
    
    ivSurePass.image = [UIImage imageNamed:@"register_password"];
    
    ivSurePass.center = CGPointMake(kScreenW/2, kScreenH/1.6);
    
    [self.view addSubview:ivSurePass];
    
    //设置注册界面输入的密码框
    surePassField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    
    surePassField.center = CGPointMake(kScreenW/2.1, kScreenH/1.6);
    
    surePassField.placeholder = @"请再次输入密码";
    
    //设置密码形式
    surePassField.secureTextEntry = YES;
    
    surePassField.keyboardType = UIKeyboardTypeDefault;
    
    [self.view addSubview:surePassField];
    
    //在手机输入框上添加确认注册的按钮
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 120, 40)];
    
    [registerBtn setTitle:@"" forState:UIControlStateNormal];
    
    [registerBtn setImage:[UIImage imageNamed:@"register_button"] forState:UIControlStateNormal];
    
    [registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    registerBtn.center = CGPointMake(kScreenW/2, kScreenH/1.3);
    
    [self.view addSubview:registerBtn];
    
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

- (void)registerAction{
    
    if (emailField.text.length == 0) {
        
        [self alertWithTitle:@"注册失败" withMessage:@"邮箱不能为空"];
        
    }else{
        
        if (![self isValidateEmail:emailField.text]) {
            
            [self alertWithTitle:@"注册失败" withMessage:@"您输入的邮箱有误，请重新输入"];
            
        }else if (passField.text.length < 6 || passField.text.length >12 || surePassField.text.length < 6 || surePassField.text.length > 12){
            
            [self alertWithTitle:@"注册失败" withMessage:@"密码或确认密码要保证为6-12位"];
        }
        else if(![passField.text isEqualToString:surePassField.text]){
            
            [self alertWithTitle:@"注册失败" withMessage:@"两次密码不一致，请重新输入"];
            
        }else{
            
            [AFNCore registerByEmail:emailField.text byPassword:passField.text byMyBlock:^(id result) {
                
                if ([(NSString *)result  isEqualToString: @"注册成功"]) {
                    
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册成功" message:@"请使用邮箱和密码登录" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                        
                        LoginViewController *loginVC = [[LoginViewController alloc]init];
                        
                        [self presentViewController:loginVC animated:YES completion:nil];
                        
                    }];
                    
                    [alert addAction:action];
                    
                    [self presentViewController:alert animated:YES completion:nil];
                    
                    
                }else{
                    
                    [self alertWithTitle:@"注册失败" withMessage:[NSString stringWithFormat:@"%@",result]];
                }
                
            }];
            
        }
        
        
    }
    
    
}


@end
