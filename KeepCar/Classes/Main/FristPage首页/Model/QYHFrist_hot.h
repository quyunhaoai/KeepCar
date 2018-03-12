//
//  QYHFrist_hot.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHFrist_hot : NSObject
/** <#注释#> */
@property (nonatomic,strong) NSString* id;
/** <#注释#> */
@property (nonatomic,strong) NSString* product_name;
/** <#注释#> */
@property (nonatomic,strong) NSString* price;
/** <#注释#> */
@property (nonatomic,strong) NSString* describe;
/** <#注释#> */
@property (nonatomic,strong) NSString* toop;
/** <#注释#> */
@property (nonatomic,strong) NSString* sell_num;
/** <#注释#> */
@property (nonatomic,strong) NSString* pingjia;
/** <#注释#> */
@property (nonatomic,strong) NSString* addtime;
/** <#注释#> */
@property (nonatomic,strong) NSString* types;
/** <#注释#> */
@property (nonatomic,strong) NSString* imgs;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)appWithDictionary:(NSDictionary *)dict;
@end
