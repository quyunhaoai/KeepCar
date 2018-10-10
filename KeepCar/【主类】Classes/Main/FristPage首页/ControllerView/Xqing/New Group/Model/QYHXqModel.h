//
//  QYHXqModel.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/12.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHXqModel : NSObject
/** <#注释#> */
@property (nonatomic,strong) NSString* id;
/** price */
@property (nonatomic,strong) NSString* price;
/** <#注释#> */
@property (nonatomic,strong) NSString* describe;
/** <#注释#> */
@property (nonatomic,strong) NSString* brand;
/** <#注释#> */
@property (nonatomic,strong) NSString* product_name;
/** 销售量 */
@property (nonatomic,strong) NSString* sell_num;
/** 内容 */
@property (nonatomic,copy) NSString* content;

/** images */
@property (nonatomic,strong) NSMutableArray* imgs;
@end
