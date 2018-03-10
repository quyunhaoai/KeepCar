//
//  QYHcustomHeadView.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/10.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHcustomHeadView.h"
#import "QYHTools.h"
#import "SDCycleScrollView.h"
@interface QYHcustomHeadView()

@property (strong, nonatomic) SDCycleScrollView *cycleScrollView;
@end

@implementation QYHcustomHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];

    }
    return self;
}
-(void)setupUI{
    self.cycleScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, QYHScreenW, 245)];
    self.cycleScrollView.showPageControl = YES;
    self.cycleScrollView.currentPageDotColor = QYHColor(0.0, 150.0, 256.0);
    self.cycleScrollView.pageDotColor = [UIColor whiteColor];
    self.cycleScrollView.pageControlDotSize = CGSizeMake(100, 80);
    self.cycleScrollView.pageControlBottomOffset = 1.0;
    [self addSubview:self.cycleScrollView];
    
    
}
-(void)setUrlArray:(NSArray *)urlArray
{
    _urlArray = urlArray;
    self.cycleScrollView.imageURLStringsGroup = urlArray;
}
-(void)setTypesArray:(NSArray *)TypesArray
{
    _TypesArray = TypesArray;
    
}
@end
