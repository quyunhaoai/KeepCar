//
//  QYHFrist_types.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHFrist_types : NSObject
/** <#注释#> */
@property (nonatomic,strong) NSString* type_title;
/** <#注释#> */
@property (nonatomic,strong) NSString* url_link;
/** <#注释#> */
@property (nonatomic,strong) NSString* thumb;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)appWithDictionary:(NSDictionary *)dict;
@end
