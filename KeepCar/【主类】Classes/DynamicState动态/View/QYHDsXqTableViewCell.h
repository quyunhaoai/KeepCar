//
//  QYHDsXqTableViewCell.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/10.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYHDStableInfo.h"
@interface QYHDsXqTableViewCell : UITableViewCell
/** xq */
@property (nonatomic,strong) QYHDStableInfo* xiangqing;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *describe;
@property (strong, nonatomic) IBOutlet UILabel *addtime;

@end
