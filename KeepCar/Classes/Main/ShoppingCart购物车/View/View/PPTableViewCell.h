//
//  PPTableViewCell.h
//  PPNumberButton
//
//  Created by YiAi on 2017/7/5.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYHShoppingListMode.h"
@class PPTableViewModel;
@interface PPTableViewCell : UITableViewCell
@property (nonatomic, strong) QYHShoppingListMode *shoppingModel;
@property (nonatomic, strong) PPTableViewModel *model;
@property (nonatomic, assign) float qyhnumber;
@property (nonatomic, copy) void(^resultBlock)(NSInteger number);
@property (strong, nonatomic) IBOutlet UIButton *selectButton;

@end


@interface PPTableViewModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger number;
@end
