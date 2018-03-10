//
//  QYHheadView.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHheadView.h"
#import "QYHTools.h"
@implementation QYHheadView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [HwTools hexStringToColor:BGColor];
        self.cycleScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, QYHScreenW, _lubo.qyh_height)];
        self.cycleScrollView.currentPageDotColor =QYHColor(100, 150, 256);
        self.cycleScrollView.pageDotColor = [UIColor whiteColor];
//        self.cycleScrollView.layer.cornerRadius = 5;
//        self.cycleScrollView.layer.masksToBounds = YES;
        [self addSubview:self.cycleScrollView];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.cycleScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, QYHScreenW, _lubo.qyh_height)];
    self.cycleScrollView.showPageControl = YES;
    self.cycleScrollView.currentPageDotColor = QYHColor(0.0, 150.0, 256.0);
    self.cycleScrollView.pageDotColor = [UIColor whiteColor];
    self.cycleScrollView.pageControlDotSize = CGSizeMake(100, 80);
    self.cycleScrollView.pageControlBottomOffset = 1.0;
    [self.lubo addSubview:self.cycleScrollView];
 
}
-(void)setUrlArray:(NSArray *)urlArray
{
    _urlArray = urlArray;
    self.cycleScrollView.imageURLStringsGroup = urlArray;
}
@end
