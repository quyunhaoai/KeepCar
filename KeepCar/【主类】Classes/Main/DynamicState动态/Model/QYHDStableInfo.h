//
//  QYHDStableInfo.h
//  KeepCar
//
//  Created by HaoBook on 2018/3/10.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHDStableInfo : NSObject
/** ID */
@property (nonatomic,strong) NSNumber* id;
/** title */
@property (nonatomic,strong) NSString* news_title;
/** describe */
@property (nonatomic,strong) NSString* describe;
/** link_url */
@property (nonatomic,strong) NSString* link_xq;
/** addtime */
@property (nonatomic,strong) NSString* addtime;
/** image */
@property (nonatomic,strong) NSString* thumb;
@end
