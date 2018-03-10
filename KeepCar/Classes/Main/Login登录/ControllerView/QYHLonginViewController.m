//
//  QYHLonginViewController.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHLonginViewController.h"
#import "QYHTools.h"
@interface QYHLonginViewController ()

@end

@implementation QYHLonginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
}
     
- (IBAction)backAction:(id)sender {
    [QYHTools UserDefaultsObj:@"0" key:@"isLogin"];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
