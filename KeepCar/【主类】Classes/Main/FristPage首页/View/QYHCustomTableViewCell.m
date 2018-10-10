//
//  QYHCustomTableViewCell.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/9.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHCustomTableViewCell.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
@implementation QYHCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setHot:(QYHFrist_hot *)hot
{
    _hot = hot;
    [self.images sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",QYHCommonURL,hot.imgs]]];
    self.product_name.text = hot.product_name;
    self.describe.text = hot.describe;
    self.price.text = [NSString stringWithFormat:@"￥%@",hot.price];
    self.sell_num.text = hot.sell_num;
    self.pingjia.text = hot.pingjia;
}
@end
