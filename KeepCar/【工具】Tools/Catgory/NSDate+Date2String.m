//
//  NSDate+Date2String.m
//  PZShoppingPro
//
//  Created by PZ_Chen on 16/5/24.
//  Copyright © 2016年 PZ_Chen. All rights reserved.
//

#import "NSDate+Date2String.h"

@implementation NSDate (Date2String)

/**
 *  日期转时间
 *
 *  @param str_FormatterStyle 日期格式
 *
 *  @return 返回字符串
 */
-(NSString *)date2StringWithFormatter:(NSString *)str_FormatterStyle{
    NSDateFormatter * datef_Temp = [[NSDateFormatter alloc] init];
    [datef_Temp setDateFormat:@"yyyy-MM-dd"];
    NSString * str_Date = [datef_Temp stringFromDate:self];
    return str_Date;
}



/**
 *  日期转时间
 *
 *  @param str_FormatterStyle 日期格式
 *  @param date               当前转化的日期
 *
 *  @return 返回字符串
 */
+(NSString *)date2StingWithFormatter:(NSString *)str_FormatterStyle withDate:(NSDate *)date{
    NSDateFormatter * datef_Temp = [[NSDateFormatter alloc] init];
    [datef_Temp setDateFormat:str_FormatterStyle];
    NSString * str_Date = [datef_Temp stringFromDate:date];
    return str_Date;
}

/**
 *  比较两个日期之间的差值
 */
- (NSDateComponents *)deltaFromDate:(NSDate *)fromDate
{
    // 日历
    NSCalendar *calender = [NSCalendar currentCalendar];
    
    // 比较时间
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 返回日期的差值
    return [calender components:unit fromDate:fromDate toDate:self options:0];
}

/**
 *  判断是否为今年
 */
- (BOOL)isThisYear
{
    // 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    return nowYear == selfYear;
}

/**
 *  判断是否为今天
 */
- (BOOL)isToday
{
    // 2015-07-28 18:30:00 -> 2015-07-28
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 日期转化为字符串
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSString *selfString = [fmt stringFromDate:self];
    return [nowString isEqualToString:selfString];
}
/**
 *  判断是否为昨天
 */
-(BOOL)isYesterDay
{
    // 2015-07-28 18:30:00 -> 2015-07-28
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 转换日期
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    // 日历(比较时间)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}


/**
 *  @author PZ_Chen, 2016年07月29日01点25分
 *
 *  根据日期计算与当前时间差值并转化对应字符串
 *
 *  @param dteCreate 要比较的日期
 *
 *  @return 返回比较后的字符串
 */
+ (NSString *)timeSting:(NSDate *)dteCreate
{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 帖子创建时间
    NSDate *createDate = dteCreate;
    
    if (createDate.isThisYear) {
        // 今年
        if (createDate.isToday) {
            // 今天
            NSDateComponents *cmps = [[NSDate date] deltaFromDate:createDate];
            if (cmps.hour >= 1) {
                // 1个小时 > 时间差
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) {
                // 1个小时 > 时间差 > 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else {
                // 1分钟 > 时间差
                return @"刚刚";
            }
        } else if (createDate.isYesterDay) {
            //昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else {
            // 其他
            fmt.dateFormat = @"MM月dd日 HH:mm";
            return [fmt stringFromDate:createDate];
        }
    } else {
        // 非今年
        fmt.dateFormat = @"yyyy年MM月dd日 HH:mm";
        return [fmt stringFromDate:createDate];
    }
}


/**
 *  @author PZ_Chen, 2016年07月29日01点25分
 *
 *  根据日期计算与当前时间差值并转化对应字符串
 *
 *  @param dteCreate 要比较的日期
 *
 *  @return 返回比较后的字符串
 */
- (NSString *)timeSting{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    return [fmt stringFromDate:self];
}

+(NSString *)timeformatFromSeconds:(NSInteger)seconds{
    
    //format of hour
    NSString *str_hour = nil;
    if (seconds/3600 != 0) {
        str_hour = [NSString stringWithFormat:@"%02ld",(long)seconds/3600];
    }
    
    //format of minute
    NSString *str_minute = nil;
    if ((seconds%3600)/60 != 0 || str_hour.length > 0 ) { //整小时时(seconds%3600)/60 = 0
        str_minute = [NSString stringWithFormat:@"%02ld",(long)(seconds%3600)/60];
    }
    
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",(long)seconds%60];
    
    //format of time
    //    NSString *format_time = [NSString stringWithFormat:@"%@",str_second];
    NSString *format_time;
    if (str_minute) {
        format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    }else{
        format_time = [NSString stringWithFormat:@"00:%@",str_second];
    }
    if (str_hour) {
        format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    }
    
    return format_time;
    
}

//返回格式为xx:xx:xx
+(NSString *)timeformat2FromSeconds:(NSInteger)seconds
{
    //format of day
    NSString *str_day = [NSString stringWithFormat:@"%02ld",seconds/(3600*24)];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",(seconds%(3600*24))/3600];;
    
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",((seconds%(3600*24))%3600)/60];
    
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    
    //format of time
    NSString *format_time = nil;
    if (seconds/(3600*24) == 0) {
        format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    }else{
        format_time = [NSString stringWithFormat:@"%@天 %@:%@:%@",str_day,str_hour,str_minute,str_second];
    }
    
    return format_time;
}

+(NSString *)timeStringFromSeconds:(NSInteger)seconds
{
    //format of hour
    NSString *str_hour = nil;
    if (seconds/3600 != 0) {
        str_hour = [NSString stringWithFormat:@"%02ld",(long)seconds/3600];
    }
    
    //format of minute
    NSString *str_minute = nil;
    if ((seconds%3600)/60 != 0 || str_hour.length > 0 ) { //整小时时(seconds%3600)/60 = 0
        str_minute = [NSString stringWithFormat:@"%02ld",(long)(seconds%3600)/60];
    }
    
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",(long)seconds%60];
    
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@秒",str_second];
    if (str_minute) {
        format_time = [NSString stringWithFormat:@"%@分钟%@秒",str_minute,str_second];
    }
    if (str_hour) {
        format_time = [NSString stringWithFormat:@"%@小时%@分钟%@秒",str_hour,str_minute,str_second];
    }
    
    return format_time;
}

/**
 *  @author PZ_Chen, 2016年09月06日05点35分
 *
 *  计时转换
 *
 *  @param index 计时时间 单位：秒
 *
 *  @return 转换后的字符串,格式为：xx天xx:xx:xx
 */
+(NSString *)intager2String:(NSInteger)index{
    index = index < 0?0:labs(index);
    NSInteger index_Day = index/(3600*24);
    NSInteger index_Hour = (index%(3600*24))/3600;
    NSInteger index_Minute = (index%3600)/60;
    NSInteger index_Second = index%60;
    NSString * str_Day = [NSString stringWithFormat:@"%@",index_Day > 0?[NSString stringWithFormat:@"%ld天 ",(long)index_Day]:@""];
    NSString * str_Hour = [NSString stringWithFormat:@"%@%ld",index_Hour < 10?@"0":@"",(long)index_Hour];
    NSString * str_Minute = [NSString stringWithFormat:@"%@%ld",index_Minute < 10?@"0":@"",(long)index_Minute];
    NSString * str_Second = [NSString stringWithFormat:@"%@%ld",index_Second < 10?@"0":@"",(long)index_Second];
    return [NSString stringWithFormat:@"%@%@:%@:%@",str_Day,str_Hour,str_Minute,str_Second];
}


//0xcb 统一格式化时间
- (NSString *)shortTimeTextOfDate
{
    return [self timeTextOfDate];
}

/*
 0xcb
 时间的展示格式，按照与当前时间的差值（TimeDifference）而展示：
 当TimeDifference 小于等于 2分钟时，显示：刚刚
 当TimeDifference 大于 2分钟而小于等于60分钟时，显示：××分钟前
 当TimeDifference 大于 60分钟而小于等于24小时时，显示：××小时前
 当TimeDifference 大于 24小时而小于等于 240小时时，显示：××天前
 当TimeDifference 大于 240小时时，显示发布日期，格式：月份-日期
 */
- (NSString *)timeTextOfDate
{
    NSDateComponents *cmps = [[NSDate date] deltaFromDate:self];
    if (cmps.year == 0 && cmps.month == 0) {
        if (cmps.day <= 10) {
            if (cmps.day == 0) {
                if (cmps.hour > 0) {
                    return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
                } else if (cmps.minute > 2) {
                    return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
                } else {
                    return @"刚刚";
                }
            }
            return [NSString stringWithFormat:@"%zd天前", cmps.day];
        }
    }
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"MM-dd";
    if (cmps.year > 0) {
        df.dateFormat = @"yyyy-MM-dd";
    }
    return [df stringFromDate:self];
}
@end
