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
#import "UIBarButtonItem+Item.h"
#import "QYHShoppingListMode.h"
@interface QYHShoppingcartTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat zhonggongjiage;
}
@property (strong, nonatomic) IBOutlet UILabel *zongjia;
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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(editTable)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSumPrice:) name:@"plusClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(minusSumPrice:) name:@"minusClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSumPrice:) name:@"plusClickNumber" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(minusSumPrice:) name:@"minusClickNumber" object:nil];
    
}
-(void)minusSumPrice:(NSNotification *)info{
    PPTableViewCell *cell = (PPTableViewCell *)info.object;
    NSDictionary *dict = info.userInfo;
    CGFloat number = [dict[@"number"] floatValue];
    zhonggongjiage = zhonggongjiage - number;
    self.zongjia.text = [NSString stringWithFormat:@"￥%.f",zhonggongjiage];
}
-(void)changeSumPrice:(NSNotification *)info{
    PPTableViewCell *cell = (PPTableViewCell *)info.object;
    NSDictionary *dict = info.userInfo;
    CGFloat number = [dict[@"number"] floatValue];
    zhonggongjiage = zhonggongjiage + number;
    self.zongjia.text = [NSString stringWithFormat:@"￥%.f",zhonggongjiage];
}


-(void)editTable{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"50" forKey:@"user_id"];

    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *del = [NSMutableArray array];
    [self.shoppingMode.data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        QYHShoppingListMode *model = (QYHShoppingListMode *)obj;
        if (model.isSelect) {
            [array addObject:[NSIndexPath indexPathForRow:idx inSection:0]];
            
            [self.shoppingMode.data removeObject:obj];
            [del addObject:[NSNumber numberWithInteger:idx]];

            [self deledata:dic];
        }
    }];
    [self.ShoppingTable deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationNone];
    [self.ShoppingTable reloadData];
    [dic setObject:del forKey:@"product_id"];
}
-(void)deledata:(NSDictionary *)dic {
    [[QYHNetWork sharedManager] postWithUrl:@"/index.php/api.php?m=api&c=Car&a=dele_car" body:[[QYHTools sharedInstance]dictionaryToJson:dic] showLoading:YES success:^(NSDictionary *response) {
        [self.view makeToast:response[@"msg"] duration:2.0 position:@"bottom"];
    } failure:^(NSError *error) {
        
    }];
}
-(void)loadData
{
    __weak typeof (self) weakSelf = self;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"50" forKey:@"user_id"];
    [params setValue:@"1" forKey:@"p"];
    [[QYHNetWork sharedManager]postWithUrl:@"/index.php/api.php?m=api&c=Car&a=my_car" body:[[QYHTools sharedInstance] dictionaryToJson:params]  showLoading:YES success:^(NSDictionary *response) {
        _shoppingMode = [QYHShoppingCartBasseMode mj_objectWithKeyValues:response];
        
        [weakSelf.ShoppingTable.mj_header endRefreshing];
        [weakSelf.ShoppingTable reloadData];
    } failure:^(NSError *error) {
                [self.view makeToast:@"网络加载失败" duration:2.0 position:@"bottom"];
                [weakSelf.ShoppingTable.mj_header endRefreshing];
    }];
}
#pragma mark TableViewDetagele
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
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
- (IBAction)allSelectButton:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;

        for (QYHShoppingListMode *model in self.shoppingMode.data) {
            model.isSelect = NO;
        }
        self.zongjia.text = [NSString stringWithFormat:@"￥0.0"];
        zhonggongjiage = 0.0;
        [self.ShoppingTable reloadData];
    }else{
        sender.selected = YES;

        CGFloat number;
        for (QYHShoppingListMode *model in self.shoppingMode.data) {
            model.isSelect = YES;
            number += model.heji;
        }
        self.zongjia.text = [NSString stringWithFormat:@"￥%.0f",number];
        [self.ShoppingTable reloadData];
    }
}
@end
