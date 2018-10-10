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
#import "CustomCollectionViewCell.h"
#import "QYHFrist_types.h"
#import "WKWebViewController.h"
#import "QYHproductXqViewController.h"
NSString *const cellID = @"hao";
static NSString *const ID = @"cellid";
static NSInteger const  cols = 4;
static CGFloat const mar = 1;
CGFloat const qyhItemH = 109;
#define itemKH     ([UIScreen mainScreen].bounds.size.width - (cols - mar))/cols
@interface QYHFristPageViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
/** headview */
@property (nonatomic,strong) QYHheadView* headView;
/** mode */
@property (nonatomic,strong) QYHFristMode* fristMode;

@property (nonatomic,strong) UICollectionView *collection;
@end

@implementation QYHFristPageViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (![[QYHTools UserDefaultsObjectForKey:@"isLogin"] isEqualToString:@"0"] || [[QYHTools UserDefaultsObjectForKey:@"isLogin"] isKindOfClass:[NSNull class]]) {
        QYHLonginViewController *loginVC = [[QYHLonginViewController alloc]init];
        
        [self presentViewController:loginVC animated:YES completion:nil];
    }
#ifdef __IPHONE_11_0
//    if ([self.TableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
//        self.TableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    }
#endif
}
-(void)viewDidLayoutSubviews
{
    NSLog(@"headView:%@",NSStringFromCGRect(self.headView.frame));
    NSLog(@"table:%@",NSStringFromCGRect(self.TableView.frame));
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewOffsetY:%f",[self viewOffsetY]);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, QYHScreenW, 0)];
    [self.view addSubview:view];
    [self loadData];
    _headView= [QYHheadView qyh_viewFromXib];
    NSLog(@"headView:%@",NSStringFromCGRect(_headView.frame));
    self.TableView.tableHeaderView = _headView;
    [self.TableView registerNib:[UINib nibWithNibName:@"QYHCustomTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self setupTypesView];
    __weak typeof (self) weakSelf = self;
    self.TableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    self.TableView.backgroundColor = [UIColor colorWithRed:.93f green:.93f blue:.956f alpha:1.f];
    _headView.cycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        NSLog(@"点击：%zd",currentIndex);
        WKWebViewController *web = [[WKWebViewController alloc] init];
        web.isNavHidden = NO;
        QYHLunbo *lunbo = (QYHLunbo *)[weakSelf.fristMode.lunbo objectAtIndex:currentIndex];
        [web loadWebURLSring:lunbo.url];
        [weakSelf.navigationController pushViewController:web animated:YES];
    };
//    if (@available(iOS 7.0,*)) {
//        /* 系统版本 >= version */
////        self.TableView.translatesAutoresizingMaskIntoConstraints = NO;
//        self.automaticallyAdjustsScrollViewInsets = NO;
//        self.TableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        self.TableView.contentInsetAdjustmentBehavior
//    }else{
//        /* 系统版本 <  */
//
//    }
    self.edgesForExtendedLayout = UIRectEdgeNone;
    if (@available(iOS 11.0, *)) {
        self.TableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}
-(void)loadData
{
    [[QYHNetWork sharedManager] requestWithMethod:GET WithPath:@"index.php/api.php?m=api&c=Index&a=index" WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        _fristMode =  [QYHFristMode modelObjectWithDictionary:dic];
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:5];
        for (QYHLunbo* obj in _fristMode.lunbo) {
            NSString *temUrl = [NSString stringWithFormat:@"%@%@",QYHCommonURL,obj.thumb];
            [mutableArray addObject:temUrl];
        }
        _headView.urlArray = mutableArray;
        if ((self.fristMode.types.count % 4)  != 0) {
            int a = (self.fristMode.types.count % 4);
            for (int i = 0; i<a; i++) {
                if (i == 0) {
                    QYHFrist_types *type = [[QYHFrist_types alloc]init];
                    type.type_title = @"汽车险";
                    type.url_link = @"qcx";
                    type.thumb = ((QYHFrist_types *)[self.fristMode.types firstObject]).thumb;
                    [self.fristMode.types addObject:type];
                }else{
                QYHFrist_types *type = [[QYHFrist_types alloc]init];
                type.type_title = @"";
                type.url_link = @"";
                type.thumb = @"";
                [self.fristMode.types addObject:type];
                }
            }
        }
        [self.TableView reloadData];
        [self.collection reloadData];
        [self.TableView.mj_header endRefreshing];
    } WithFailurBlock:^(NSError *error) {
        NSLog(@"error=%@",error);
        [self.view makeToast:@"网络加载失败" duration:2.0 position:@"bottom"];
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QYHproductXqViewController *xqing = [[QYHproductXqViewController alloc]init];
    QYHFrist_hot *hot =(QYHFrist_hot *)self.fristMode.hot[indexPath.row];
    
    xqing.product_id = hot.id;
    [self.navigationController pushViewController:xqing animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return QYHHeadMarin;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return QYHHeadMarin;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    UIView *view = [[UIView alloc]init];
//    view.backgroundColor = [UIColor colorWithRed:.93f green:.93f blue:.956f alpha:1.f];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(0, 0, QYHScreenW, 0);
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

-(void)setupTypesView
{
    /*
     1.初始化要设置流水布局
     2.cell必须要注册
     3.cell必须自定义
     */
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    NSInteger number = 4;
    CGFloat margin = 1;
    CGFloat itmesWH = ([UIScreen mainScreen].bounds.size.width)/number;
    
    layout.itemSize = CGSizeMake(itmesWH, qyhItemH);
    
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = 0;
    
    UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:self.headView.Types.bounds collectionViewLayout:layout];
    
    collectionview.backgroundColor = [UIColor colorWithRed:.93f green:.93f blue:.956f alpha:1.f];
    collectionview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.headView.Types addSubview: collectionview];
    
    collectionview.delegate = self;
    collectionview.dataSource = self;
    collectionview.scrollEnabled = NO;
    
    [collectionview registerNib:[UINib nibWithNibName:NSStringFromClass([CustomCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    self.collection = collectionview;
}
#pragma mark UIcollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.fristMode.types.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.Head = self.fristMode.types[indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__FUNCTION__);
    WKWebViewController *web = [[WKWebViewController alloc] init];
    web.isNavHidden = NO;
    QYHFrist_types *lunbo = (QYHFrist_types *)[self.fristMode.types objectAtIndex:indexPath.row];
    [web loadWebURLSring:lunbo.url_link];
    [self.navigationController pushViewController:web animated:YES];
}
@end
