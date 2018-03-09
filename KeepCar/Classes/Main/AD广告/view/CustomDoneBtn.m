//
//  CustomDoneBtn.m
//  WebViewAD
//
//  Created by hao on 16/3/4.
//  Copyright © 2016年 hao. All rights reserved.
//

#import "CustomDoneBtn.h"

@interface CustomDoneBtn ()
@property (nonatomic,strong) UILabel *timeLab;
//@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) int fireTime;
@end

@implementation CustomDoneBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame time:(int)mytime {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView:mytime];
    }
    return self;
}
- (void)setupView:(int)mytime {
   
    self.bounds = CGRectMake(0, 0, 70, 70);
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    
    self.layer.cornerRadius = 35;
    self.layer.masksToBounds = YES;
    
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setTitle:@"跳过" forState:UIControlStateNormal];
    self.titleEdgeInsets = UIEdgeInsetsMake(-17, 0, 0, 0);
    [self addTarget:self action:@selector(doneBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.fireTime = mytime;
    self.timeLab.text = [NSString stringWithFormat:@"%dS",self.fireTime];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFire) userInfo:nil repeats:YES];
    self.timeLab.frame = CGRectMake(70-45, 35, 20, 20);
  
    
    [self addSubview:self.timeLab];
}
- (void)timeFire {
    self.fireTime --;
    self.timeLab.text = [NSString stringWithFormat:@"%dS",self.fireTime];
    if (self.fireTime <= 0) {
        if (self.completionHandler) {
            self.completionHandler();
        }
        [self.timer invalidate];
    }
}
- (void)doneBtnClick {
    if (self.completionHandler) {
        self.completionHandler();
    }
}
- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
        _timeLab.textColor = [UIColor whiteColor];
        _timeLab.font = [UIFont systemFontOfSize:15];
    }
    return _timeLab;
}

@end
