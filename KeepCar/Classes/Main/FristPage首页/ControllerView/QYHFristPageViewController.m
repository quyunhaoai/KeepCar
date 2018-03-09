//
//  QYHFristPageViewController.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/8.
//  Copyright © 2018年 Qyh. All rights reserved.
//
#import "QYHLonginViewController.h"
#import "QYHFristPageViewController.h"
#import "QYHTools.h"
@interface QYHFristPageViewController ()

@end

@implementation QYHFristPageViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = self.tabTitleStr;
    if ([[QYHTools UserDefaultsObjectForKey:@"isLogin"] isEqualToString:@"0"]) {
        QYHLonginViewController *loginVC = [[QYHLonginViewController alloc]init];
        
        [self presentViewController:loginVC animated:YES completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

@end
