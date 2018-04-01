//
//  AppDelegate.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/8.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "AppDelegate.h"
//#import "CustomerViewController.h"
//#import <AFNetworking/AFNetworking/AFNetworking.h>
#import "AFNetworking.h"
#import "QYHCustomViewController.h"
@interface AppDelegate ()
{
        UIView* launchView;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    /*创建跟控制器和窗口*/
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"NewLaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"NewLaunchScreen"];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];

    launchView = viewController.view;
    UILabel *lable = [launchView viewWithTag:11];
    lable.hidden = NO;
    UIButton *JumpButton = [launchView viewWithTag:10];
    [JumpButton addTarget:self action:@selector(removeLauchView) forControlEvents:UIControlEventTouchUpInside];
    JumpButton.hidden = NO;
    
//    CustomerViewController *AdVC = [[CustomerViewController alloc] init];
//    QYHCustomViewController *AdVC = [[QYHCustomViewController alloc] init];
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = AdVC;
//    [self.window makeKeyAndVisible];
    /*开始监控网络状态*/
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    return YES;
}
-(void)removeLauchView
{
    QYHCustomViewController *vc = [[QYHCustomViewController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    [launchView removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
