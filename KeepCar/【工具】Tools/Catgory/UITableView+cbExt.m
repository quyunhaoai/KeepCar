//
//  UITableView+cbExt.m
//  XiyuanPro
//
//  Created by 常彪 on 16/7/8.
//  Copyright © 2016年 HengPin. All rights reserved.
//

#import "UITableView+cbExt.h"

@implementation UITableView (cbExt)
- (void)registerNibClass:(Class)nibCellClass
{
    [self registerNib:[UINib nibWithNibName:CBCellNib(nibCellClass) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CBCellId(nibCellClass)];
}
@end



@implementation UIImageView (cbExt)
- (void)cb_setHeadImageWithURL:(NSURL *)url
{
    self.clipsToBounds = YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
//    [self sd_setImageWithURL:url placeholderImage:@"" options:0 progress:nil completed:nil];
}

@end
