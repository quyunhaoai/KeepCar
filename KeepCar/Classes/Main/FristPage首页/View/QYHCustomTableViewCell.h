//
//  QYHCustomTableViewCell.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYHFrist_hot.h"
@interface QYHCustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *images;
@property (strong, nonatomic) IBOutlet UILabel *product_name;
@property (strong, nonatomic) IBOutlet UILabel *describe;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *sell_num;
@property (strong, nonatomic) IBOutlet UILabel *pingjia;

/** hot */
@property (nonatomic,strong) QYHFrist_hot* hot;
@end
