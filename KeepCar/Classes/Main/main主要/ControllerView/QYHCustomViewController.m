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
#import "MeTableViewController.h"
#import "QYHTools.h"
@interface QYHCustomViewController ()<AKTabBarControllerDelegate>
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
    
    QYHFristPageViewController *fristPage = [[QYHFristPageViewController alloc] initWithNibName:@"QYHFristPageViewController" bundle:nil];
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
    
//    QYHMeTableViewController *me = [[QYHMeTableViewController alloc]init];
    UIStoryboard *MainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MeTableViewController *me = [MainStory instantiateViewControllerWithIdentifier:@"MeTableView"];
    QYHBaseNavigationViewController *meNav = [[QYHBaseNavigationViewController alloc]initWithRootViewController:me];
    me.tabImageNameStr = @"icon_mine_normal";
    me.activeTabImageNameStr = @"icon_mine";
    me.tabTitleStr = @"我的";
    
    [self setViewControllers:[NSMutableArray arrayWithObjects:fristNav,DynsmicStateNav,ShoppingNav,meNav,nil]];

    [self setHidesBottomBarWhenPushed:YES];
    
    [self setIconColors:@[[UIColor clearColor],
                          [UIColor clearColor]]];
    
    [self setSelectedIconColors:@[[UIColor clearColor],
                                  [UIColor clearColor]]];
    [self setTextColor:QYHColor(102, 102, 102)];
    [self setSelectedTextColor:QYHColor(0, 191, 243)];
    UIImage *image =[QYHTools createImageWithColor:[QYHTools hexStringToColor:@"#FFFFFF"]];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setBackgroundImage:image];
    [self setSelectedBackgroundImage:image];
    
    
    [self setTabEdgeColor:[UIColor clearColor]];
    [self setTabStrokeColor:[UIColor clearColor]];
    self.iconShadowColor = [UIColor clearColor];
    self.iconGlossyIsHidden = YES;
    
    self.selectedIconOuterGlowColor = [UIColor clearColor];
    self.tabStrokeColor = [UIColor clearColor];
    self.selectedIconOuterGlowColor = [UIColor clearColor];

//    self.delegate = self;

}

@end
