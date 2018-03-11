//
//  QYHShoppingcartTableViewController.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/8.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHShoppingcartTableViewController.h"
#import "PPTableViewCell.h"
#import "QYHShoppingCartBasseMode.h"
#import "MJExtension.h"
#import "MJRefresh.h"
@interface QYHShoppingcartTableViewController ()<UITableViewDelegate,UITableViewDataSource>
/** <#注释#> */
@property (nonatomic,strong) QYHShoppingCartBasseMode* shoppingMode;
@end
static NSString *const cellID = @"PPcell";
@implementation QYHShoppingcartTableViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.title = self.tabTitleStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self.ShoppingTable registerNib:[UINib nibWithNibName:@"PPTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    __weak typeof (self) weakSelf = self;;
    self.ShoppingTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)loadData
{
    __weak typeof (self) weakSelf = self;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"50" forKey:@"user_id"];
    [params setValue:@"1" forKey:@"p"];
    [[QYHNetWork sharedManager]requestWithMethod:GET WithPath:@"/index.php/api.php?m=api&c=Car&a=my_car" WithParams:params WithSuccessBlock:^(NSDictionary *dic) {
        _shoppingMode = [QYHShoppingCartBasseMode mj_objectWithKeyValues:dic];
        [weakSelf.ShoppingTable.mj_header endRefreshing];
    } WithFailurBlock:^(NSError *error) {
        [self.view makeToast:@"网络加载失败" duration:2.0 position:@"bottom"];
        [weakSelf.ShoppingTable.mj_header endRefreshing];
    }];
}
#pragma mark TableViewDetagele
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shoppingMode.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.shoppingModel = self.shoppingMode.data[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
}
@end
