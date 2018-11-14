//
//  UIActionSheet+Block.h
//  PZShoppingPro
//
//  Created by PZ_Chen on 16/6/15.
//  Copyright © 2016年 PZ_Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (Block)

-(void) handlerClickedButton:(void (^)(NSInteger btnIndex))aBlock;

@end
