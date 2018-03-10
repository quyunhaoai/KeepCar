//
//  QYHDynamicStateTableViewController.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/8.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHDynamicStateTableViewController.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "QYHDynamicstateBassInfo.h"
#import "QYHDsXqTableViewCell.h"
#import "QYHDStableInfo.h"
static NSString *const cellID = @"Dsxiangqing";
@interface QYHDynamicStateTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *DSTableView;
/** bass */
@property (nonatomic,strong) QYHDynamicstateBassInfo* bass;
@end

@implementation QYHDynamicStateTableViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.title = self.tabTitleStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self.DSTableView registerNib:[UINib nibWithNibName:NSStringFromClass([QYHDsXqTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    MJWeakSelf
    self.DSTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
}
-(void)loadData{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"1" forKey:@"p"];
    [params setValue:@"1" forKey:@"user_id"];
    [[QYHNetWork sharedManager] requestWithMethod:GET WithPath:@"/index.php/api.php?m=api&c=Index&a=shequ" WithParams:params WithSuccessBlock:^(NSDictionary *dic) {
        _bass = [QYHDynamicstateBassInfo mj_objectWithKeyValues:dic];
//        NSLog(@"%@",_bass.msg);
//        NSString *tem= _bass.toop.news_title;
//        NSLog(@"%@",tem);
////        NSLog(@"%@",_bass.toop);
//        for (QYHDStableInfo *obj in _bass.date) {
//            NSLog(@"%@",obj.news_title);
//        }
//
////        NSLog(@"%@",_bass.date[0].addtime);
        [_bass.date insertObject:_bass.toop atIndex:0];
        [self.DSTableView reloadData];
        [self.DSTableView.mj_header endRefreshing];
    } WithFailurBlock:^(NSError *error) {
        
    }];
    
    
}
#pragma mark TableViewDelegat
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bass.date.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYHDsXqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.xiangqing = self.bass.date[indexPath.row];
    return cell;
}

@end
