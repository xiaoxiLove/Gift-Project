//
//  AppDelegate.m
//  Gift-Project
//
//  Created by mac on 16/6/2.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "AppDelegate.h"
#import <MaxLeap/MaxLeap.h>
#import "HotViewController.h"
#import "BaseNavigationController.h"
#import "CustomTabBarController.h"
#import "LeftViewController.h"
#import "MMDrawerController.h"

@interface AppDelegate ()
{
    CustomTabBarController *custom;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    //配置Maxleap数据库
    [MaxLeap setApplicationId:@"5750da42169e7d0001a5fece" clientKey:@"LWZsY3RPNEUxMnQ4N2NBNUxSRDdrZw" site:MLSiteCN];
    
    MLObject *obj = [MLObject objectWithoutDataWithClassName:@"Test" objectId:@"561c83c0226"];
    
    [obj fetchIfNeededInBackgroundWithBlock:^(MLObject * _Nullable object, NSError * _Nullable error) {
        
        if (error.code == kMLErrorInvalidObjectId) {
            
            NSLog(@"已经能够正确连接上您的云端应用");
            
        } else {
            
            NSLog(@"应用访问凭证不正确，请检查。");
        }
    }];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor clearColor];
    
    [self.window setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@""]]];
    
    [self.window makeKeyAndVisible];
    
    [self Load];

    
    return YES;
}

-(void)Load
{
    NSArray *vc_names = @[@"Home",@"Hot",@"My"];
    
    NSMutableArray *navs = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<vc_names.count; i++) {
        
        Class class = NSClassFromString([NSString stringWithFormat:@"%@ViewController",vc_names[i]]);
        
        
        BaseViewController *vc = [[class alloc]init];
        
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
        
        //设置标签图片
        
        vc.tabBarItem.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        
        [navs addObject:nav];
        
    }
    
    custom = [[CustomTabBarController alloc]initWithSelectedImage:[UIImage imageNamed:@""] tabBarBackgroundImage:[UIImage imageNamed:@""]];
    
    custom.viewControllers = navs;
    
    custom.selectedIndex = 2;
    
    //创建侧滑控制器
    //创建左侧视图
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    
    leftVC.view.backgroundColor = [UIColor redColor];
    //创建侧滑控制器
    MMDrawerController *drawerVC = [[MMDrawerController alloc] initWithCenterViewController:custom leftDrawerViewController:leftVC];
    
    //设置侧滑的距离
    drawerVC.maximumLeftDrawerWidth = 200;
    //阴影
    drawerVC.showsShadow = YES;
    
    //阴影颜色
    drawerVC.shadowColor = [UIColor grayColor];
    
    //阴影偏移量
    drawerVC.shadowOffset = CGSizeMake(-5, 0);
    
    
    //打开与关闭的触发手势
    drawerVC.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    
    drawerVC.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
    //将侧滑控制器作为根视图控制器
    self.window.rootViewController = drawerVC;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
