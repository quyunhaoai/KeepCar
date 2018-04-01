//
//  PPTableViewCell.m
//  PPNumberButton
//
//  Created by YiAi on 2017/7/5.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import "PPTableViewCell.h"
#import "PPNumberButton.h"
#import "UIImageView+WebCache.h"
@interface PPTableViewCell () <PPNumberButtonDelegate>

@property (nonatomic, strong) PPNumberButton *numberButton;
@property (strong, nonatomic) IBOutlet UIImageView *images;
@property (strong, nonatomic) IBOutlet UILabel *product_name;
@property (strong, nonatomic) IBOutlet UILabel *price;

@end

@implementation PPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.contentView addSubview:self.numberButton];
    
}

- (void)setModel:(PPTableViewModel *)model
{
    _model = model;
    self.numberButton.currentNumber = model.number;
}
-(void)setShoppingModel:(QYHShoppingListMode *)shoppingModel
{
    _shoppingModel = shoppingModel;
    self.numberButton.currentNumber = [shoppingModel.num floatValue];
    self.product_name.text = shoppingModel.product_name;
    self.qyhnumber = [shoppingModel.num floatValue];
    self.price.text = [NSString stringWithFormat:@"￥%@",shoppingModel.price];
    [self.images sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",QYHCommonURL,shoppingModel.thumb]]];
    self.selectButton.selected = shoppingModel.isSelect;
    _shoppingModel.heji = [shoppingModel.price floatValue] * [shoppingModel.num floatValue];
    
}
#pragma mark - PPNumberButtonDelegate
- (void)pp_numberButton:(PPNumberButton *)numberButton number:(NSInteger)number increaseStatus:(BOOL)increaseStatus
{
    _model.number = number;
    self.qyhnumber = number;
    NSLog(@"%.f",number);
    __weak typeof (self) weakSelf = self;
    weakSelf.qyhnumber = number;
    CGFloat mun = [_shoppingModel.price floatValue];
    weakSelf.shoppingModel.heji = mun;
    if (weakSelf.shoppingModel.isSelect) {
        if (increaseStatus) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"plusClickNumber" object:weakSelf userInfo:@{@"number":[NSNumber numberWithFloat:mun]}];
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"minusClickNumber" object:weakSelf userInfo:@{@"number":[NSNumber numberWithFloat:mun]}];
        }
    }
}

#pragma mark - lazy
- (PPNumberButton *)numberButton
{
    if (!_numberButton) {
        _numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 110 - 20, 75-30-10, 110, 30)];
        _numberButton.delegate = self;
        // 初始化时隐藏减按钮
//        _numberButton.decreaseHide = YES;
//        _numberButton.increaseImage = [UIImage imageNamed:@"increase_meituan"];
//        _numberButton.decreaseImage = [UIImage imageNamed:@"decrease_meituan"];
        _numberButton.borderColor = [UIColor grayColor];
        _numberButton.increaseTitle = @"＋";
        _numberButton.decreaseTitle = @"－";
//        numberButton.currentNumber = 777;
        _numberButton.stepValue = 1;
        __weak typeof (self) weakSelf = self;
        _numberButton.resultBlock = ^(PPNumberButton *ppBtn, CGFloat number, BOOL increaseStatus) {

            
        };
    }
    return _numberButton;
}
- (IBAction)selectAction:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        self.shoppingModel.isSelect = NO;
        CGFloat jianqu = _shoppingModel.heji;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"minusClick" object:self userInfo:@{@"number":[NSNumber numberWithFloat:jianqu]}];
    }else{
        sender.selected = YES;
        self.shoppingModel.isSelect = YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"plusClick" object:self userInfo:@{@"number":[NSNumber numberWithFloat:_shoppingModel.heji]}];
    }

}

@end

@implementation PPTableViewModel

@end
