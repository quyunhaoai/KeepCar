//
//  QYHbutton.m
//  TabBarDemo
//
//  Created by hao on 17/9/15.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "QYHbutton.h"

@implementation QYHbutton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setHighlighted:(BOOL)highlighted{
    
};
- (CGRect)backgroundRectForBounds:(CGRect)bounds{
        return CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height);
}
//-(CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//      return CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height);
//}
- (CGRect)imageRectForContentRect:(CGRect)bounds{

    return CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height);

}
@end
