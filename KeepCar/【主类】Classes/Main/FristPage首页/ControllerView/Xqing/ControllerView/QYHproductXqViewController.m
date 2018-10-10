//
//  QYHproductXqViewController.m
//  KeepCar
//
//  Created by HaoBook on 2018/3/12.
//  Copyright © 2018年 Qyh. All rights reserved.
//

#import "QYHproductXqViewController.h"
#import "QYHNetWork.h"
#import "SDCycleScrollView.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "QYHXqBassesModel.h"
#import "QYHXqModel.h"
#import "AFNetworking.h"
#import "QYHCustomXqTableViewCell.h"
@interface QYHproductXqViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 轮播图 */
@property (nonatomic,strong) SDCycleScrollView* cycleScrollView;
/** model */
@property (nonatomic,strong) QYHXqBassesModel* bassesModel;

/** bottomView */
@property (nonatomic,strong) UIView* BottomView;
/** product_id */
@property (copy, nonatomic) NSString *productid;
@end
static NSString *const cellID = @"cell";
@implementation QYHproductXqViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"商品详情";
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.XqTableView.tableHeaderView= self.cycleScrollView;
    [self.XqTableView registerNib:[UINib nibWithNibName:@"QYHCustomXqTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.XqTableView.tableFooterView = self.BottomView;
}
-(UIView *)BottomView
{
    if (!_BottomView) {
        _BottomView = [[UIView alloc] init];
        _BottomView.frame = CGRectMake(0, 0, QYHScreenW, 300);
        _BottomView.backgroundColor = [UIColor whiteColor];
    }
    return _BottomView;
}
-(SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, QYHScreenW, 222.5)];
        _cycleScrollView.showPageControl = YES;
        _cycleScrollView.currentPageDotColor = QYHColor(0.0, 150.0, 256.0);
        _cycleScrollView.pageDotColor = [UIColor whiteColor];
        _cycleScrollView.pageControlDotSize = CGSizeMake(100, 80);
//        _cycleScrollView.pageControlBottomOffset = 0.5;
        _cycleScrollView.hidesForSinglePage = NO;
        _cycleScrollView.autoScroll = YES;
    }
    return _cycleScrollView;
}
-(void)loadData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.product_id forKey:@"product_id"];
    NSData *body = [self dictionaryToJson:params];
    [[QYHNetWork sharedManager] postWithUrl:@"/index.php/api.php?m=api&c=Product&a=product_xq" body:body showLoading:YES success:^(NSDictionary *response) {
        _bassesModel = [QYHXqBassesModel mj_objectWithKeyValues:response];
        QYHXqModel *model = (QYHXqModel *)_bassesModel.data;
        NSLog(@"--%@--",model.imgs);
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
        for (NSDictionary *dic in model.imgs) {
            NSString *thumb = [NSString stringWithFormat:@"%@%@",QYHCommonURL,dic[@"thumb"]];
            [array addObject:thumb];
        }
        self.cycleScrollView.imageURLStringsGroup = array;
        self.productid = model.id;
        [self.XqTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
}
- (NSData *)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError =nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
//    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonData;
}
#pragma mark TableView_delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    QYHCustomXqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.row = indexPath.row;
    cell.model = (QYHXqModel *)self.bassesModel.data;
//    if (indexPath.row == 0) {
//
//    }else if (indexPath.row == 1){
//
//    }else if (indexPath.row == 2){
//
//    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 46.0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 490.0;
//}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 445.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return QYHHeadMarin;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:.93f green:.93f blue:.956f alpha:1.f];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return QYHHeadMarin;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:.93f green:.93f blue:.956f alpha:1.f];
    return view;
}
- (IBAction)addShoppingCart:(id)sender {
    NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
    [parmas setValue:@"50" forKey:@"user_id"];
    [parmas setValue:self.product_id forKey:@"product_id"];
    
    [[QYHNetWork sharedManager] postWithUrl:@"/index.php/api.php?m=api&c=Car&a=add_car" body:[self dictionaryToJson:parmas] showLoading:YES success:^(NSDictionary *response) {
        [self.view makeToast:response[@"msg"] duration:2.0 position:@"bottom"];
    } failure:^(NSError *error) {
        [self.view makeToast:@"网络加载错误" duration:2.0 position:@"bottom"];
    }];
    
}
- (IBAction)NowPay:(id)sender {
    
}

@end
