//
//  QYHCustomXqTableViewCell.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/12.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHCustomXqTableViewCell.h"

@implementation QYHCustomXqTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(QYHXqModel *)model
{
    _model = model;
    if (self.row == 0) {
        self.leftBottom.hidden = NO;
        self.leftTop.hidden = NO;
        self.rigthTop.hidden = NO;
        self.leftTop.text = model.product_name;
        self.leftBottom.text = model.describe;
        self.rigthTop.text = [NSString stringWithFormat:@"￥%@",model.price];
        self.centerRight.hidden = YES;
        self.centerLeft.hidden = YES;

    }else if (self.row == 1){
        self.leftBottom.hidden = YES;
        self.leftTop.hidden = YES;
        self.rigthTop.hidden = YES;
        self.centerRight.hidden = NO;
        self.centerLeft.hidden = NO;
        self.centerRight.text = model.sell_num;
        self.centerLeft.text = @"销量";
    }else if (self.row == 2){
        self.leftBottom.hidden = YES;
        self.leftTop.hidden = YES;
        self.rigthTop.hidden = YES;
        self.centerRight.hidden = NO;
        self.centerLeft.hidden = NO;
        self.centerRight.text = model.brand;
        self.centerLeft.text = @"品牌";
        
    }
}
@end
