//
//  NSDate+Date2String.h
//  PZShoppingPro
//
//  Created by PZ_Chen on 16/5/24.
//  Copyright © 2016年 PZ_Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Date2String)

/**
 *  日期转时间
 *
 *  @param str_FormatterStyle 日期格式
 *
 *  @return 返回字符串
 */
-(NSString *)date2StringWithFormatter:(NSString *)str_FormatterStyle;


/**
 *  日期转时间
 *
 *  @param str_FormatterStyle 日期格式
 *  @param date               当前转化的日期
 *
 *  @return 返回字符串
 */
+(NSString *)date2StingWithFormatter:(NSString *)str_FormatterStyle withDate:(NSDate *)date;

/**
 *  比较两个日期之间的差值
 */
- (NSDateComponents *)deltaFromDate:(NSDate *)fromDate;

/**
 *  判断是否为今年
 */
- (BOOL)isThisYear;

/**
 *  判断是否为今天
 */
- (BOOL)isToday;

/**
 *  判断是否为昨天
 */
- (BOOL)isYesterDay;

/**
 *  @author PZ_Chen, 2016年07月29日01点25分
 *
 *  根据日期计算与当前时间差值并转化对应字符串
 *
 *  @param dteCreate 要比较的日期
 *
 *  @return 返回比较后的字符串
 */
+ (NSString *)timeSting:(NSDate *)dteCreate;

/**
 *  @author PZ_Chen, 2016年07月29日01点25分
 *
 *  根据日期计算与当前时间差值并转化对应字符串
 *
 *  @param dteCreate 要比较的日期
 *
 *  @return 返回比较后的字符串
 */
- (NSString *)timeSting;

//输入时间的秒数，返回时间的小时、分钟和秒，返回格式是 xx:xx或xx:xx:xx
+(NSString *)timeformatFromSeconds:(NSInteger)seconds;
//输入时间的秒数，返回时间的小时、分钟和秒，返回格式是：xx小时xx分钟xx秒或xx分钟xx秒或xx秒
+(NSString *)timeStringFromSeconds:(NSInteger)seconds;
//返回格式为xx:xx:xx
+(NSString *)timeformat2FromSeconds:(NSInteger)seconds;

/**
 *  @author PZ_Chen, 2016年09月06日05点35分
 *
 *  计时转换
 *
 *  @param index 计时时间 单位：秒
 *
 *  @return 转换后的字符串,格式为：xx天xx:xx:xx
 */

+(NSString *)intager2String:(NSInteger)index;

- (NSString *)shortTimeTextOfDate;

- (NSString *)timeTextOfDate;

@end
