//
//  QYHFristMode.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHFristMode : NSObject<NSCoding,NSCopying>

/** dat */
@property (nonatomic,strong) NSDictionary* data;
/** msg */
@property (nonatomic,strong) NSString* msg;
/** status */
@property (nonatomic,strong) NSNumber* status;
/** <#注释#> */
@property (nonatomic,strong) NSMutableArray* lunbo;
/** <#注释#> */
@property (nonatomic,strong) NSMutableArray* types;
/**  */
@property (nonatomic,strong) NSMutableArray* hot;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

-(id)objectOrNilForKey:(id)key fromDictionary:(NSDictionary *)dict;

@end
