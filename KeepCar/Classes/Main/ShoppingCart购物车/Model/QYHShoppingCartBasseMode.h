//
//  QYHShoppingCartBasseMode.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/11.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHShoppingCartBasseMode : NSObject
/** msg */
@property (nonatomic,strong) NSString* msg;
/** status */
@property (nonatomic,strong) NSNumber* status;
/** data */
@property (nonatomic,strong) NSMutableArray* data;

@end
