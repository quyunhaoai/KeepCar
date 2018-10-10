//
//  QYHLunbo.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHLunbo.h"

@implementation QYHLunbo
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)appWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
