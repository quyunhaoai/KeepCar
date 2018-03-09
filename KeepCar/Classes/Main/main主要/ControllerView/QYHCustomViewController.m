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
    
    QYHFristPageViewController *fristPage = [[QYHFristPageViewController alloc] init];
    QYHBaseNavigationViewController *fristNav = [[QYHBaseNavigationViewController alloc] initWithRootViewController:fristPage];
    fristPage.tabImageNameStr = @"icon_index_normal";
    fristPage.activeTabImageNameStr = @"icon_index";
    fristPage.tabTitleStr = @"首页";
    
    QYHDynamicStateTableViewController *DynsmicState = [[QYHDynamicStateTableViewController alloc]init];
    QYHBaseNavigationViewController *DynsmicStateNav = [[QYHBaseNavigationViewController alloc]initWithRootViewController:DynsmicState];
    DynsmicState.tabImageNameStr = @"icon_order_normal";
    DynsmicState.tabTitleStr = @"动态";
    DynsmicState.activeTabImageNameStr = @"icon_order";
    
    QYHShoppingcartTableViewController *ShoppingVc = [[QYHShoppingcartTableViewController alloc]init];
    QYHBaseNavigationViewController *ShoppingNav = [[QYHBaseNavigationViewController alloc]initWithRootViewController:ShoppingVc];
    ShoppingVc.tabImageNameStr = @"icon_cart_normal";
    ShoppingVc.tabTitleStr = @"购物车";
    ShoppingVc.activeTabImageNameStr = @"icon_cart";
    
    QYHMeTableViewController *me = [[QYHMeTableViewController alloc]init];
    QYHBaseNavigationViewController *meNav = [[QYHBaseNavigationViewController alloc]initWithRootViewController:me];
    me.tabImageNameStr = @"icon_mine_normal";
    me.activeTabImageNameStr = @"icon_mine";
    me.tabTitleStr = @"我";
    
    [self setViewControllers:[NSMutableArray arrayWithObjects:fristNav,DynsmicStateNav,ShoppingNav,meNav,nil]];

    [self setHidesBottomBarWhenPushed:YES];
    
    [self setIconColors:@[[UIColor clearColor],
                          [UIColor clearColor]]];
    
    [self setSelectedIconColors:@[[UIColor clearColor],
                                  [UIColor clearColor]]];
    [self setTextColor:[UIColor blackColor]];
    [self setSelectedTextColor:[UIColor blueColor]];
    [self setBackgroundImage:[QYHTools createImageWithColor:[QYHTools hexStringToColor:@"#FFFFFF"]]];
    
    [self setTabEdgeColor:[UIColor clearColor]];
    [self setTabStrokeColor:[UIColor clearColor]];
    
    self.iconGlossyIsHidden = YES;
    [self setTextColor:[UIColor blackColor]];
    [self setSelectedTextColor:[UIColor blueColor]];
    [self setSelectedBackgroundImage:[QYHTools createImageWithColor:[QYHTools hexStringToColor:@"#FFFFFF"]]];
    
    /*
    
//    [self setTabColors:@[[UIColor colorWithRed:0.502 green:0.000 blue:0.000 alpha:1.000],
//                         [UIColor colorWithRed:0.400 green:1.000 blue:0.400 alpha:1.000]]];
//    [self setTopEdgeColor:[UIColor blackColor]];
    

//    [self setBackgroundImageName:nil];
//
//    [self setSelectedBackgroundImageName:nil];
    self.tabEdgeColor = [QYHTools hexStringToColor:@"000000"];//分割线
    
  


    
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
