//
//  QYHXqBassesModel.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/12.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYHXqModel.h"
@interface QYHXqBassesModel : NSObject
/** status */
@property (nonatomic,strong) NSNumber* status;
/** msg */
@property (nonatomic,strong) NSString* msg;
/** data */
@property (nonatomic,strong) QYHXqModel* data;

@end
