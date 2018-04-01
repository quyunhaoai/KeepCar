//
//  QYHShoppingcartTableViewController.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/8.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYHBaseTableViewController.h"
#import "QYHBaseViewController.h"
@interface QYHShoppingcartTableViewController : QYHBaseViewController
@property (strong, nonatomic) IBOutlet UITableView *ShoppingTable;
@property (strong, nonatomic) IBOutlet UIView *BottomView;
/** select */
@property (copy, nonatomic) void (^SelectAction)(BOOL isSelect);
@end
