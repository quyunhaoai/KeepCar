/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import "QYHBaseViewController.h"

/** @brief tabeleView的cell高度 */
//#define KCELLDEFAULTHEIGHT 50

/** @brief 带加载、刷新的Controller(包含UITableView) */

@interface BaseRefreshTableViewController : QYHBaseViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_rightItems;
}

/** @brief 导航栏右侧BarItem */
@property (strong, nonatomic) NSArray *rightItems;
/** @brief 默认的tableFooterView */
@property (strong, nonatomic) UIView *defaultFooterView;

@property (strong, nonatomic) UITableView *tableView;

/** @brief tableView的数据源，用户UI显示 */
@property (strong, nonatomic) NSMutableArray *dataArray;

///** @brief tableView的数据源，用户UI显示。只做消息时使用 */
//@property (strong, nonatomic) NSMutableArray *notificationDataArray;

@property (strong, nonatomic) NSMutableDictionary *dataDictionary;

/**
 初始化ViewController

 @param style tableView样式
 @return instancetype
 */
- (instancetype)initWithStyle:(UITableViewStyle)style;

@end
