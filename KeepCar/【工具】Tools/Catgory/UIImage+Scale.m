//
//  UIImage+Scale.m
//  XiyuanPro
//
//  Created by PZ_Chen on 16/8/26.
//  Copyright © 2016年 HengPin. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

/**
 *  @author PZ_Chen, 2016年08月26日10点46分
 *
 *  缩放图片
 *
 *  @param scale 缩放比例（0-1之间）
 *
 *  @return 缩放后的图片
 */
-(UIImage *)scale:(float)scale{
    NSData * data = UIImageJPEGRepresentation(self, scale);
    return [UIImage imageWithData:data];
}


@end
