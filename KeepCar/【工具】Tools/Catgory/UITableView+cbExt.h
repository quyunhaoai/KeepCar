//
//  UITableView+cbExt.h
//  XiyuanPro
//
//  Created by 常彪 on 16/7/8.
//  Copyright © 2016年 HengPin. All rights reserved.
//

#import <UIKit/UIKit.h>


#define CBCellNib(C) NSStringFromClass(C)
#define CBCellId(C) NSStringFromClass(C)


@interface UITableView (cbExt)
- (void)registerNibClass:(Class)nibCellClass;
@end

@interface UIImageView (cbExt)
- (void)cb_setHeadImageWithURL:(NSURL *)url;
@end
