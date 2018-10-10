//
//  QYHDynamicstateBassInfo.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/10.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYHDStableInfo.h"
@interface QYHDynamicstateBassInfo : NSObject
/** msg */
@property (nonatomic,strong) NSString* msg;
/** status */
@property (nonatomic,strong) NSString* status;
/** toop */
@property (nonatomic,strong) QYHDStableInfo* toop;
/** data */
@property (nonatomic,strong) NSMutableArray* date;

@end
