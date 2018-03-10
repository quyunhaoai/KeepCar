//
//  QYHFristPageViewController.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/8.
//  Copyright © 2018年 Qyh. All rights reserved.
//
#import "QYHLonginViewController.h"
#import "QYHFristPageViewController.h"
#import "QYHTools.h"
#import "QYHNetWork.h"
#import "QYHFristMode.h"
#import "QYHLunbo.h"
#import "QYHheadView.h"
#import "MJRefresh.h"
#import "QYHCustomTableViewCell.h"
NSString *const cellID = @"hao";
@interface QYHFristPageViewController ()<UITableViewDelegate,UITableViewDataSource>
/** <#注释#> */
@property (nonatomic,strong) QYHheadView* headView;
/** <#注释#> */
@property (nonatomic,strong) QYHFristMode* fristMode;
@end

@implementation QYHFristPageViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (![[QYHTools UserDefaultsObjectForKey:@"isLogin"] isEqualToString:@"0"] || [[QYHTools UserDefaultsObjectForKey:@"isLogin"] isKindOfClass:[NSNull class]]) {
        QYHLonginViewController *loginVC = [[QYHLonginViewController alloc]init];
        
        [self presentViewController:loginVC animated:YES completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    _headView= [QYHheadView qyh_viewFromXib];
    self.TableView.tableHeaderView = _headView;
    [self.TableView registerNib:[UINib nibWithNibName:@"QYHCustomTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    __weak typeof (self) weakSelf = self;
    self.TableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
}
-(void)loadData
{
    [[QYHNetWork sharedManager] requestWithMethod:GET WithPath:@"index.php/api.php?m=api&c=Index&a=index" WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        _fristMode =  [QYHFristMode modelObjectWithDictionary:dic];
//        NSLog(@"%@",fristMode.lunbo[0]);
//        QYHLunbo *lunbo =(QYHLunbo *)fristMode.lunbo[0];
//        NSLog(@"%@",lunbo.url);
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:5];
        for (QYHLunbo* obj in _fristMode.lunbo) {
            NSString *temUrl = [NSString stringWithFormat:@"%@%@",QYHCommonURL,obj.thumb];
            [mutableArray addObject:temUrl];
        }
        _headView.urlArray = mutableArray;
        
        [self.TableView reloadData];
        
        [self.TableView.mj_header endRefreshing];
    } WithFailurBlock:^(NSError *error) {
        NSLog(@"error=%@",error);
    }];
}
#pragma mark TableView_delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fristMode.hot.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYHCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.hot = self.fristMode.hot[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76.0;
}
@end
