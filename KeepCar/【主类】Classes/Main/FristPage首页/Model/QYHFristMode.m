//
//  QYHFristMode.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.

#import "QYHLunbo.h"
#import "QYHFrist_types.h"
#import "QYHFrist_hot.h"
#import "QYHFristMode.h"
#import "MJExtension.h"
NSString *const data = @"data";
NSString *const msg = @"msg";
NSString *const status = @"status";
NSString *const lunbo = @"lunbo";
NSString *const types = @"types";
NSString *const hot = @"hot";
@implementation QYHFristMode

@synthesize msg = _msg;
@synthesize data = _data;
@synthesize status = _status;
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        
        self.data = [self objectOrNilForKey:data fromDictionary:dict];
        self.msg  = [self objectOrNilForKey:msg fromDictionary:dict];
        self.status = [self objectOrNilForKey:status fromDictionary:dict];
        if ([[_data objectForKey:lunbo] isKindOfClass:[NSArray class]]) {
            self.lunbo = [QYHLunbo mj_objectArrayWithKeyValuesArray:[_data objectForKey:lunbo]];
        }
        if ([[_data objectForKey:types] isKindOfClass:[NSArray class]]) {
            self.types = [QYHFrist_types mj_objectArrayWithKeyValuesArray:[_data objectForKey:types]];
        }
        if ([[_data objectForKey:hot] isKindOfClass:[NSArray class]]) {
            self.hot = [QYHFrist_hot mj_objectArrayWithKeyValuesArray:[_data objectForKey:hot]];
        }
    }
    
    return self;
    
}
#pragma mark Help Method
-(id)objectOrNilForKey:(id)key fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:key];
    return [object isEqual:[NSNull null]] ? nil:object;
}
#pragma description Method
-(NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:_status forKey:status];
    [mutableDict setValue:_data forKey:data];
    [mutableDict setValue:_msg forKey:msg];
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@",[self dictionaryRepresentation]];
}
#pragma nscode Method
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_data forKey:data];
    [aCoder encodeObject:_msg forKey:msg];
    [aCoder encodeObject:_status forKey:status];
    
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.data = [aDecoder decodeObjectForKey:data];
        self.msg = [aDecoder decodeObjectForKey:msg];
        self.status = [aDecoder decodeObjectForKey:status];
    }
    return self;
}
#pragma nscopy Method
-(id)copyWithZone:(NSZone *)zone
{
    QYHFristMode *per = [[QYHFristMode alloc]init];
    per.data = self.data;
    per.msg = self.msg;
    per.status = self.status;
    return per;
}
@end
