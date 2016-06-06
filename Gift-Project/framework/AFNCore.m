//
//  AFNCore.m
//  Gift-Project
//
//  Created by mac on 16/6/6.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "AFNCore.h"
#import <Maxleap/MaxLeap.h>
#import "UserModel.h"

@implementation AFNCore

+ (void)registerByEmail:(NSString *)email byPassword:(NSString *)password byMyBlock:(MyBlock)block{
    
    MLUser *user = [MLUser user];
    
    user.username = email;
    
    user.password = password;
    
    user.email = email;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (succeeded) {
            
            NSLog(@"注册成功");
            
            block(@"注册成功");
            
        } else {
            
            NSString *errorString = [error userInfo][@"NSLocalizedDescription"];
            
            NSString *error = [errorString stringByReplacingOccurrencesOfString:@"用户名" withString:@"邮箱"];
            
            NSLog(@"注册失败,错误为：%@",error);
            
            block(error);
        }
    }];
    
    
}


+ (void)loginByEmail:(NSString *)email byPassword:(NSString *)password byMyBlock:(MyBlock)block{
    
    [MLUser logInWithUsernameInBackground:email password:password block:^(MLUser *user, NSError *error) {
        
        if (user) {
            
            block(@"登录成功");
            
        } else {
            
            block([error userInfo][@"NSLocalizedDescription"]);
            
        }
    }];
}

+ (NSArray *)queryUserInformationByEmail:(NSString *)email{
    
    //查询语句
    MLQuery *query = [MLQuery queryWithClassName:@"_User"];
    
    [query whereKey:@"email" equalTo:email];
    
    NSMutableArray *datalist = [[NSMutableArray alloc]init];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if (!error) {
            
            NSLog(@"%@",objects);
            
            for (NSInteger i = 0; i<objects.count; i++) {
                
                MLObject *myObject = objects[i];
                
                UserModel *model = [[UserModel alloc]init];
                
            }
        }
    }];
    
    
}

@end
