//
//  BaseNavigationController.m
//  PRO1
//
//  Created by CORYIL on 16/3/21.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     *  1.更改导航栏的背景图片
     */
    
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navbg.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    /**
     *  2.更改导航栏标题字体
     */
    
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];


}

/**
 *  修改当前控制器状态栏样式
 */

- (UIStatusBarStyle )preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
}





@end
