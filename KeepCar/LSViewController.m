//
//  LSViewController.m
//  LaunchScreenAnimation-Storyboard
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Cave. All rights reserved.
//

#import "LSViewController.h"
#import "QYHCustomViewController.h"
@interface LSViewController ()
/** <#注释#> */
@property (nonatomic,strong) NSTimer* timer;
/** time */
@property (nonatomic,assign) int fireTime;
@end

@implementation LSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _timer  = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFire) userInfo:nil repeats:YES];
    self.fireTime = 3;
}

- (void)timeFire {
    self.fireTime --;
    self.TimeLable.text = [NSString stringWithFormat:@"%dS",self.fireTime];
    if (self.fireTime <= 0) {
//        if (self.completionHandler) {
//            self.completionHandler();
//        }
        QYHCustomViewController *vc = [[QYHCustomViewController alloc] init];
        
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
        [self.timer invalidate];
    }
}
@end
