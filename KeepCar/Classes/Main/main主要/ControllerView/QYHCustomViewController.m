//
//  QYHCustomViewController.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/8.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHCustomViewController.h"
#import "QYHFristPageViewController.h"
#import "QYHDynamicStateTableViewController.h"
#import "QYHShoppingcartTableViewController.h"
#import "QYHMeTableViewController.h"

#import "QYHBaseNavigationViewController.h"
#import "QYHBaseTableViewController.h"

#import "QYHTools.h"
@interface QYHCustomViewController ()
/** <#注释#> */
@property (nonatomic,strong) NSMutableArray* Views;
@end

@implementation QYHCustomViewController
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupChildview];
        
    }
    return self;
}

-(void)setupChildview{
    
    QYHFristPageViewController *one = [[QYHFristPageViewController alloc] init];
    QYHBaseNavigationViewController *nav = [[QYHBaseNavigationViewController alloc] initWithRootViewController:one];
    one.tabImageNameStr = @"icon_index_normal";
    one.activeTabImageNameStr = @"icon_index";
    one.tabTitleStr = @"首页";
    
    QYHDynamicStateTableViewController *fiveView = [[QYHDynamicStateTableViewController alloc]init];
    QYHBaseNavigationViewController *NewNav = [[QYHBaseNavigationViewController alloc]initWithRootViewController:fiveView];
    fiveView.tabImageNameStr = @"icon_order_normal";
    fiveView.tabTitleStr = @"动态";
    fiveView.activeTabImageNameStr = @"icon_order";
    
    QYHShoppingcartTableViewController *two = [[QYHShoppingcartTableViewController alloc]init];
    QYHBaseNavigationViewController *friendNav = [[QYHBaseNavigationViewController alloc]initWithRootViewController:two];
    two.tabImageNameStr = @"icon_cart_normal";
    two.tabTitleStr = @"购物车";
    two.activeTabImageNameStr = @"icon_cart";
    
    QYHMeTableViewController *me = [[QYHMeTableViewController alloc]init];
    QYHBaseNavigationViewController *meNav = [[QYHBaseNavigationViewController alloc]initWithRootViewController:me];
    me.tabImageNameStr = @"icon_mine_normal";
    me.activeTabImageNameStr = @"icon_mine";
    me.tabTitleStr = @"我";
    
    [self setViewControllers:[NSMutableArray arrayWithObjects:nav,NewNav,friendNav,meNav,nil]];

    [self setHidesBottomBarWhenPushed:YES];
    
    [self setIconColors:@[[UIColor clearColor],
                          [UIColor clearColor]]];
    
    [self setSelectedIconColors:@[[UIColor clearColor],
                                  [UIColor clearColor]]];
    [self setTextColor:[UIColor blackColor]];
    [self setSelectedTextColor:[UIColor blueColor]];
    
    /*
    
//    [self setTabColors:@[[UIColor colorWithRed:0.502 green:0.000 blue:0.000 alpha:1.000],
//                         [UIColor colorWithRed:0.400 green:1.000 blue:0.400 alpha:1.000]]];
//    [self setTopEdgeColor:[UIColor blackColor]];
    
    [self setBackgroundImage:[QYHTools createImageWithColor:[QYHTools hexStringToColor:@"111111"]]];
    [self setSelectedBackgroundImage:[QYHTools createImageWithColor:[QYHTools hexStringToColor:@"111111"]]];
//    [self setBackgroundImageName:nil];
//
//    [self setSelectedBackgroundImageName:nil];
    self.tabEdgeColor = [QYHTools hexStringToColor:@"000000"];//分割线
    
  
    [self setTabEdgeColor:[UIColor clearColor]];
    [self setTabStrokeColor:[UIColor clearColor]];
    
    self.iconGlossyIsHidden = YES;
    [self setTextColor:[UIColor blackColor]];
    [self setSelectedTextColor:[UIColor blueColor]];
    
    //        self.topEdgeColor = [UIColor clearColor];
      /*
    StringsXmlBase *base = [StringsXML getStringXmlBase];
    self.selectedIconOuterGlowColor = [UIColor clearColor];
    // Text Color
    
    self.iconGlossyIsHidden = YES;
    [self setTextColor:[HwTools hexStringToColor:base.bMenubarTextcolorNomal]];
    
    
    
    
    [self setSelectedTextColor:[HwTools hexStringToColor:base.bMenubarTextcolorActive]];
    
    self.defaultBadge = [JSCustomBadge customBadgeWithString:@""
                                             withStringColor:[UIColor whiteColor]
                                              withInsetColor:[UIColor redColor]
                                              withBadgeFrame:YES
                                         withBadgeFrameColor:[UIColor whiteColor]
                                                   withScale:1.0f
                                                 withShining:NO];
    */
}

@end
