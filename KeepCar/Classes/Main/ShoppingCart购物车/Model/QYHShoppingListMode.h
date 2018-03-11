//
//  QYHShoppingListMode.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/11.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHShoppingListMode : NSObject
/** id */
@property (nonatomic,strong) NSString* id;
/** <#注释#> */
@property (nonatomic,strong) NSString* product_id;
/** <#注释#> */
@property (nonatomic,strong) NSString* num;
/** 产品名 */
@property (nonatomic,strong) NSString* product_name;
/** <#注释#> */
@property (nonatomic,strong) NSString* price;
/** <#注释#> */
@property (nonatomic,strong) NSString* shop_id;
/** <#注释#> */
@property (nonatomic,strong) NSString* priceall;
/** <#注释#> */
@property (nonatomic,strong) NSString* thumb;

@end
