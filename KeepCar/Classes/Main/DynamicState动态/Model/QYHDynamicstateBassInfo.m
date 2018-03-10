//
//  QYHDynamicstateBassInfo.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/10.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHDynamicstateBassInfo.h"
#import "QYHDStableInfo.h"
@implementation QYHDynamicstateBassInfo
+ (NSDictionary *)objectClassInArray{
    return @{
             @"date" : [QYHDStableInfo class],
             };
}
+ (Class)objectClassInArray:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"QYHDStableInfo"]) {
        return [QYHDStableInfo class];
    }
    return nil;
    
}

@end
