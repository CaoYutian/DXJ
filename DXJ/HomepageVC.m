//
//  HomepageVC.m
//  DXJ
//
//  Created by Sunshine on 2017/10/8.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "HomepageVC.h"

#import "ShufflingFigureView.h"
#import "SectionheaderV.h"
#import "homeTableViewCell.h"

#define kScreenWidth             ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight            ([[UIScreen mainScreen] bounds].size.height)
#define UIColorRGBA(r, g, b, a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
@interface HomepageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) ShufflingFigureView *ShufflingFigure;
@property (nonatomic, strong) NSMutableArray *ShufflingFigureData;


@end

@implementation HomepageVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"整点好货";
    
    [self setUpUI];
}

- (void)setUpUI {
    [self.view addSubview:self.homeTableView];
    
    self.ShufflingFigure = [ShufflingFigureView zlImageViewDisplayViewWithFrame:CGRectMake(0, 0, kScreenWidth, 129)];
    
    _ShufflingFigureData = [NSMutableArray arrayWithArray:@[
                                                            @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496737322490&di=27716cba2c3271ab8fe771218bdececa&imgtype=0&src=http%3A%2F%2Fimg10.360buyimg.com%2Fn1%2Fjfs%2Ft460%2F73%2F172779934%2F161835%2F72c54212%2F545491caN632aaf77.jpg",
                                                            @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496737215445&di=172eae48714dc6f354e668fcb660adb5&imgtype=0&src=http%3A%2F%2Fimg01.taopic.com%2F160327%2F240382-16032FU02137.jpg",
                                                            @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496731764023&di=684ffdc28db0d25936334442df2faa17&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Fqiche%2Farticle%2F2016%2F03%2F25%2Fff976d8725d1032de5eacfc62baa8d12.jpg"]];
    
    self.ShufflingFigure.scrollInterval = _ShufflingFigureData.count;
    self.ShufflingFigure.animationInterVale = 0.6;
    self.ShufflingFigure.imageViewArray = _ShufflingFigureData;
    self.homeTableView.tableHeaderView = self.ShufflingFigure;
    
    [self.ShufflingFigure addTapEventForImageWithBlock:^(NSInteger imageIndex) {
        NSLog(@"第%ld个-----》",(long)imageIndex);
    }];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    homeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[homeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
//    [((homeTableViewCell *)cell) setCellData:self.dataArray[indexPath.row] atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 37.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SectionheaderV *sectionTitle = [[SectionheaderV alloc] initWithFrame:CGRectMake(12.5, 0, kScreenWidth - 25, 50) titleInfo:nil];
    return sectionTitle;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 127;
}


#pragma mark 懒加载
- (UITableView *)homeTableView {
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        _homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _homeTableView;
}

@end
