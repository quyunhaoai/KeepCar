//
//  QYHShoppingCartBasseMode.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/11.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHShoppingCartBasseMode.h"
#import "QYHShoppingListMode.h"
@implementation QYHShoppingCartBasseMode
+ (NSDictionary *)objectClassInArray{
    return @{
             @"data" : [QYHShoppingListMode class],
             };
}
@end
