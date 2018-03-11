//
//  CustomCollectionViewCell.m
//  UIstoryboadyLearn
//
//  Created by hao on 2017/11/28.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "QYH.h"
#import "UIImageView+WebCache.h"
@interface CustomCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *headimage;

@end
@implementation CustomCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.name sizeToFit];
//    self.headimage.contentMode = UIViewContentModeScaleToFill;
    [_headimage setContentScaleFactor:[[UIScreen mainScreen] scale]];
    _headimage.contentMode =  UIViewContentModeScaleAspectFit;
    _headimage.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _headimage.clipsToBounds  = YES;
}
-(void)setHead:(QYHFrist_types *)Head
{
    _Head = Head;
//    UIImage *image = [UIImage imageNamed:@""];
    [self.headimage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",QYHCommonURL,Head.thumb]]];
    self.name.text = Head.type_title;
}
-(void)layoutSubviews
{
    NSLog(@"headimage:%@",NSStringFromCGRect(self.headimage.frame));
    NSLog(@"name:%@",NSStringFromCGRect(self.name.frame));
}
@end
