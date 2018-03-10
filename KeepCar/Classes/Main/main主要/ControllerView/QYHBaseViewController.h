//
//  QYHBaeViewController.h
//  QYHocialSDK
//
//  Created by wyq.Cloudayc on 11/22/16.
//  Copyright © 2016 UMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYHNetWork.h"
#import "QYHTools.h"
@interface QYHBaseViewController : UIViewController

@property (nonatomic, strong) NSString *titleString;
@property(nonatomic, strong) NSString *tabTitleStr;
@property(nonatomic, strong) NSString *tabImageNameStr;
@property(nonatomic, strong) NSString *activeTabImageNameStr;
- (CGFloat)viewOffsetY;

@end
