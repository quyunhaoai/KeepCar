//
//  QYHproductXqViewController.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/12.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYHproductXqViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *XqTableView;
/** id */
@property (copy, nonatomic) NSString *product_id;
@end
