//
//  UIActionSheet+Block.m
//  PZShoppingPro
//
//  Created by PZ_Chen on 16/6/15.
//  Copyright © 2016年 PZ_Chen. All rights reserved.
//

#import "UIActionSheet+Block.h"
#import <objc/runtime.h>

/**
 *  链接标示
 */
static NSString * const UIActionSheet_key_clicked = @"UIActionSheet_key_clicked";

@interface UIActionSheet ()<UIActionSheetDelegate>


@end

@implementation UIActionSheet (Block)

-(void) handlerClickedButton:(void (^)(NSInteger btnIndex))aBlock{
    self.delegate = self;
    objc_setAssociatedObject(self, (__bridge const void *)(UIActionSheet_key_clicked), aBlock, OBJC_ASSOCIATION_COPY);
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^block)(NSInteger btnIndex) = objc_getAssociatedObject(self, (__bridge const void *)(UIActionSheet_key_clicked));
    
    if (block) block(buttonIndex);
}

@end
