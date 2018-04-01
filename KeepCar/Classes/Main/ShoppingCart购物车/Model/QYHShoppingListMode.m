//
//  QYHShoppingListMode.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/11.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHShoppingListMode.h"

@implementation QYHShoppingListMode
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)appWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
-(id)valueForUndefinedKey:(NSString *)key
{
    return @"";
}
@end
