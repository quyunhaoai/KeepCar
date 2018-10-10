//
//  QYHheadView.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
@interface QYHheadView : UIView
@property (strong, nonatomic) IBOutlet UIView *lubo;
@property (strong, nonatomic) IBOutlet UIView *Types;
@property (strong, nonatomic) NSArray *urlArray;
@property (strong, nonatomic) SDCycleScrollView *cycleScrollView;
@property (strong, nonatomic) NSArray *TypesArray;
@end
