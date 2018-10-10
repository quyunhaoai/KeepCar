//
//  QYHLunbo.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHLunbo : NSObject
/** <#注释#> */
@property (nonatomic,strong) NSString* thumb;
/** url */
@property (nonatomic,strong) NSString* url;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)appWithDictionary:(NSDictionary *)dict;
@end
