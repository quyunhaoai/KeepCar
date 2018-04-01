//
//  QYHCustomXqTableViewCell.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/12.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYHXqModel.h"
@interface QYHCustomXqTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *leftTop;
@property (strong, nonatomic) IBOutlet UILabel *leftBottom;
@property (strong, nonatomic) IBOutlet UILabel *rigthTop;
@property (strong, nonatomic) IBOutlet UILabel *centerLeft;
@property (strong, nonatomic) IBOutlet UILabel *centerRight;
/** <#注释#> */
@property (nonatomic,assign) NSInteger row;
/** model */
@property (nonatomic,strong) QYHXqModel* model;
@end
