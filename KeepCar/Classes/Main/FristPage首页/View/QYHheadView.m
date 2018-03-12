//
//  QYHheadView.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHheadView.h"
#import "QYHTools.h"
#import "QYHFrist_types.h"
#import "UIImage+Image.h"
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
-(SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
    _cycleScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, QYHScreenW, _lubo.qyh_height)];
    _cycleScrollView.showPageControl = YES;
    _cycleScrollView.currentPageDotColor = QYHColor(0.0, 150.0, 256.0);
    _cycleScrollView.pageDotColor = [UIColor whiteColor];
    _cycleScrollView.pageControlDotSize = CGSizeMake(100, 80);
    _cycleScrollView.pageControlBottomOffset = 0.5;
    }
    return _cycleScrollView;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.lubo addSubview:self.cycleScrollView];
//    NSLog(@"%@",NSStringFromCGRect(self.lubo.frame));
//    NSLog(@"%@",NSStringFromCGRect(self.Types.frame));
}
-(void)setUrlArray:(NSArray *)urlArray
{
    _urlArray = urlArray;
    self.cycleScrollView.imageURLStringsGroup = urlArray;
}
-(void)setTypesArray:(NSArray *)TypesArray
{
    _TypesArray = TypesArray;
//    for (QYHFrist_types *type in TypesArray) {
//
//    }
//    [TypesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        QYHFrist_types *type = (QYHFrist_types *)obj;
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.tag = idx;
//        button.frame =CGRectMake(0, 0, 60, 60);
//        [button setImage:nil forState:UIControlStateNormal];
//        [self.Types addSubview:button];
//    }];
}
-(void)layoutSubviews
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"lubo:%@",NSStringFromCGRect(self.lubo.frame));
    NSLog(@"types:%@",NSStringFromCGRect(self.Types.frame));
    NSLog(@"self:%@",NSStringFromCGRect(self.frame));
    self.lubo.qyh_height = 245.0;
    self.Types.qyh_height = 245.0;
}
@end
