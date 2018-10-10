//
//  QYHDsXqTableViewCell.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/10.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHDsXqTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation QYHDsXqTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.image.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setXiangqing:(QYHDStableInfo *)xiangqing
{
    _xiangqing = xiangqing;
    self.title.text = xiangqing.news_title;
    self.describe.text = xiangqing.describe;
    self.addtime.text = xiangqing.addtime;
    [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",QYHCommonURL,xiangqing.thumb]]];
}
@end
