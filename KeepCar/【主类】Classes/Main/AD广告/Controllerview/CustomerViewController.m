//
//  CustomerViewController.m
//  xibLearn
//
//  Created by hao on 2017/11/21.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "CustomerViewController.h"
#import "QYHTabbarViewController.h"
#import "CustomDoneBtn.h"
#import "QYH.h"
#import "QYHCustomViewController.h"
@interface CustomerViewController ()
{
    NSInteger number;
}
@property (weak, nonatomic) IBOutlet UIImageView *LaunchScreen;
@property (retain, nonatomic) UIImageView *customPrepLoadingActView;
@property (weak, nonatomic) IBOutlet CustomDoneBtn *mybutton;
@property (strong, nonatomic) CustomDoneBtn *jumpBut;
//@property (weak, nonatomic) NSTimer *timer;

@end


@implementation CustomerViewController

- (IBAction)clickAction:(id )sender {
//    QYHTabbarViewController *vc = [[QYHTabbarViewController alloc] init];
    
    QYHCustomViewController *vc = [[QYHCustomViewController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    [self.jumpBut.timer invalidate];
     
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
//    UIImage * image = [self getTheLaunchImage];
    UIImage *image = [UIImage imageNamed:@"icon_launcher"];
    self.LaunchScreen.image = image;
    BOOL extractedExpr = QYHiPhoneX;
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width-90, extractedExpr? 60 : 40, 70, 70);
    self.jumpBut = [[CustomDoneBtn alloc] initWithFrame:frame time:3];
    __weak typeof (self) KweakSelf = self;
    _jumpBut.completionHandler = ^{
        [KweakSelf clickAction:nil];
    };
    [self.view addSubview:_jumpBut];
    
/*
    self.mybutton.layer.cornerRadius = 6;
    self.mybutton.layer.masksToBounds = YES;
    self.mybutton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loadInView)];
    [self.view addGestureRecognizer:tap];
*/
}
-(void)loadInView
{
    QYHTabbarViewController *vc = [[QYHTabbarViewController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    [self.timer invalidate];
}

/*
-(void)timerAction
{
    NSLog(@"%s",__FUNCTION__);
    static int i = 10;
    if (i == 0) {
        [self clickAction:nil];
    }
    i --;
    [self.mybutton setTitle:[NSString stringWithFormat:@"跳过(%d)",i] forState:UIControlStateNormal];
    
}
 */
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
