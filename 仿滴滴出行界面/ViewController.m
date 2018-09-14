//
//  ViewController.m
//  仿滴滴出行界面
//
//  Created by joyshow on 2018/9/14.
//  Copyright © 2018年 石虎. All rights reserved.
//

#import "ViewController.h"
#import "SHTableView.h"

/* 屏幕的尺寸 */
#define SHScreenW [UIScreen mainScreen].bounds.size.width
#define SHScreenH [UIScreen mainScreen].bounds.size.height
#define SHCell_height 200
#define SHCell_Count  8

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *sh_tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {

    UIImageView *sh_imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    sh_imageView.image = [UIImage imageNamed:@"qin_ai_nv_shen"];
    [self.view addSubview:sh_imageView];
    
    //20为状态栏高度；sh_tableView 设置的大小要和view的大小一致
    SHTableView *sh_tableView = [[SHTableView alloc] initWithFrame:CGRectMake(0, 20, SHScreenW, SHScreenH) style:UITableViewStyleGrouped];
    
    //tableview不延时
    self.sh_tableView.delaysContentTouches = NO;
    for (UIView *subView in self.sh_tableView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subView).delaysContentTouches = NO;
        }
    }
    
    //tableview下移
    sh_tableView.contentInset = UIEdgeInsetsMake(500, 0, 0, 0);
    
    sh_tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SHScreenW, 0.001)];//去掉头部空白
    sh_tableView.backgroundColor = [UIColor clearColor];
    sh_tableView.delegate = self;
    sh_tableView.dataSource = self;
    sh_tableView.showsVerticalScrollIndicator = NO;
    sh_tableView.sectionHeaderHeight = 0.0;//消除底部空白
    sh_tableView.sectionFooterHeight = 0.0;//消除底部空白
    self.sh_tableView = sh_tableView;
    [self.view addSubview:sh_tableView];
    
}

#pragma mark - cell数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return SHCell_Count;
}

#pragma mark - cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return SHCell_height;
}

#pragma mark - 每个cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [UITableViewCell new];

    if(indexPath.row % 2 == 0){
        cell.backgroundColor = [UIColor orangeColor];
        UILabel *sh_label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SHScreenW, SHCell_height)];
        sh_label.text = @"仿滴滴出行界面";
        [cell.contentView addSubview:sh_label];
    }else{
        cell.backgroundColor = [UIColor redColor];
        UIImageView *sh_imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SHScreenW, SHCell_height)];
        sh_imageView.image = [UIImage imageNamed:@"aaaaaa"];
        [cell.contentView addSubview:sh_imageView];
    }
    return cell;
}

#pragma mark - 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"shihu---点击了cell");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
