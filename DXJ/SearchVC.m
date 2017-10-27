//
//  SearchVC.m
//  DXJ
//
//  Created by Sunshine on 2017/9/27.
//  Copyright © 2017年 Sunshine. All rights reserved.
//

#import "SearchVC.h"
#import "IMJIETagFrame.h"
#import "IMJIETagView.h"

#define SearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hisDatas.data"] // 搜索历史存储路径
#define kScreenWidth             ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight            ([[UIScreen mainScreen] bounds].size.height)
#define UIColorRGBA(r, g, b, a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface SearchVC ()<UISearchBarDelegate,IMJIETagViewDelegate>
@property (nonatomic, strong) IMJIETagView *tagView;
@property (nonatomic, strong) UIView *historyRecordBgView;
@property (nonatomic, strong) UIView *hotSearchBgView;

// 搜索的数据
@property (nonatomic, strong) NSMutableArray *datas;
// 历史搜索数据
@property (nonatomic, strong) NSMutableArray *hisDatas;
// 搜索历史记录缓存数量，默认为10
@property (nonatomic, assign) NSUInteger searchHistoriesCount;
@end

@implementation SearchVC

/** 视图完全显示 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 弹出键盘
    [self.searchBar becomeFirstResponder];
}

/** 视图即将消失 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 回收键盘
    [self.searchBar resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorRGBA(242, 242, 242, 1.0);
    
    self.searchHistoriesCount = 10;

    self.recommendGoods = @"魔术保温瓶";
    [self SetUpSearchBar];
    
    [self SetUpHistoryRecord];
    [self SetUpHotSearch];

}

#pragma mark 创建搜索框
- (void)SetUpSearchBar {
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(10, 7, kScreenWidth-64-20, 30)];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-10, 0, titleView.frame.size.width, 30)];
    searchBar.placeholder = self.recommendGoods;
    searchBar.delegate = self;
    searchBar.backgroundColor = [UIColor whiteColor];
    searchBar.layer.cornerRadius = 8;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:8];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    [titleView addSubview:searchBar];
    self.searchBar = searchBar;
    self.navigationItem.titleView = titleView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelDidClick)];
}

#pragma mark 创建历史记录
- (void)SetUpHistoryRecord {
    //有历史记录在创建
    if (self.hisDatas.count) {
        IMJIETagFrame *frame = [[IMJIETagFrame alloc] init];
        frame.tagsMinPadding = 15;
        frame.tagsMargin = 10;
        frame.tagsLineSpacing = 10;
        frame.tagsArray = self.hisDatas;
        
        self.historyRecordBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, frame.tagsHeight + 36)];
        self.historyRecordBgView.backgroundColor = [UIColor whiteColor];
        
        //历史记录
        UILabel *historyTitle = [[UILabel alloc] initWithFrame:CGRectMake(12, 17, 100, 17)];
        historyTitle.font = [UIFont systemFontOfSize:14];
        historyTitle.text = @"历史记录";
        historyTitle.textColor = [UIColor grayColor];
        historyTitle.textAlignment = NSTextAlignmentLeft;
        [self.historyRecordBgView addSubview:historyTitle];
        
        //删除按钮
        UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 45, 17, 15, 17)];
        [deleteBtn setBackgroundImage:[UIImage imageNamed:@"shanchu"] forState:UIControlStateNormal];
        [deleteBtn addTarget:self action:@selector(emptySearchHistoryDidClick) forControlEvents:UIControlEventTouchUpInside];
        [self.historyRecordBgView addSubview:deleteBtn];
        
        //content
        IMJIETagView *tagView = [[IMJIETagView alloc] initWithFrame:CGRectMake(0, 36, kScreenWidth, frame.tagsHeight)];
        tagView.clickbool = YES;
        tagView.borderSize = 0.5;
        tagView.clickborderSize = 0.5;
        tagView.tagsFrame = frame;
        tagView.clickBackgroundColor = [UIColor whiteColor];
        tagView.clickborderColor = [UIColor orangeColor];
        tagView.clickTitleColor = [UIColor orangeColor];
        tagView.clickStart = 0;
        tagView.delegate = self;
        self.tagView = tagView;
        [self.historyRecordBgView addSubview:tagView];
        
        [self.view addSubview:self.historyRecordBgView];
    }
    
}

#pragma mark 创建热门搜索
- (void)SetUpHotSearch {
    NSArray *hotSearchArr = @[@"保温杯",@"婴儿奶瓶",@"足球",@"保温杯",@"婴儿奶瓶",@"足球",@"保温杯",@"婴儿奶瓶",@"足球",@"保温杯",@"婴儿奶瓶",@"足球",@"等等等……"];
    
    IMJIETagFrame *frame = [[IMJIETagFrame alloc] init];
    frame.tagsMinPadding = 15;
    frame.tagsMargin = 10;
    frame.tagsLineSpacing = 10;
    frame.tagsArray = hotSearchArr;
    
    //判断有无历史数据
    if (self.hisDatas.count) {
        self.hotSearchBgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.historyRecordBgView.frame.size.height + self.historyRecordBgView.frame.origin.y + 10, kScreenWidth, frame.tagsHeight + 36)];
    }else {
        self.hotSearchBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 56, kScreenWidth, frame.tagsHeight + 36)];
    }
    self.hotSearchBgView.backgroundColor = [UIColor whiteColor];
    
    //热门搜索
    UILabel *hotSearchTitle = [[UILabel alloc] initWithFrame:CGRectMake(12, 17, 100, 17)];
    hotSearchTitle.font = [UIFont systemFontOfSize:14];
    hotSearchTitle.text = @"热门搜索";
    hotSearchTitle.textColor = [UIColor grayColor];
    hotSearchTitle.textAlignment = NSTextAlignmentLeft;
    [self.hotSearchBgView addSubview:hotSearchTitle];
    
    //content
    IMJIETagView *tagView = [[IMJIETagView alloc] initWithFrame:CGRectMake(0, 36, kScreenWidth, frame.tagsHeight)];
    tagView.clickbool = YES;
    tagView.borderSize = 0.5;
    tagView.clickborderSize = 0.5;
    tagView.tagsFrame = frame;
    tagView.clickBackgroundColor = [UIColor whiteColor];
    tagView.clickborderColor = [UIColor orangeColor];
    tagView.clickTitleColor = [UIColor orangeColor];
    tagView.clickStart = 0;
    tagView.delegate = self;
    self.tagView = tagView;
    tagView.clickStart = 1;
    tagView.clickArray = @[@"保温杯",@"婴儿奶瓶"];//多选 tagView.clickStart 为1
    
    [self.hotSearchBgView addSubview:tagView];
    
    [self.view addSubview:self.hotSearchBgView];
}

#pragma mark 选中
-(void)IMJIETagView:(NSArray *)tagArray{
    
    NSLog(@"选择第--->%@个---》搜索",tagArray);
}

- (void)cancelDidClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 清除历史记录
- (void)emptySearchHistoryDidClick {
    [self.hisDatas removeAllObjects];
    [self.hisDatas writeToFile:SearchHistoryPath atomically:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.historyRecordBgView removeFromSuperview];
        [self SetUpHistoryRecord];
        [self.hotSearchBgView removeFromSuperview];
        [self SetUpHotSearch];
    });

}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (self.searchBar.text.length) {
        [self.searchBar resignFirstResponder];
        [self SearchAction];
        NSInteger i = 0;
        
        //判断历史数据中是否搜索过该数据 如搜索过就不重新写入历史数据中
        for (NSString *text in self.hisDatas) {
            if ([text isEqualToString:self.searchBar.text]) {
                i ++;
            }
        }
        if (!i) {
            
            // 移除多余的缓存  判断历史记录是否超出限制
            if (self.hisDatas.count > self.searchHistoriesCount) {
                // 移除最后一条缓存
                [self.hisDatas removeLastObject];
            }
            
            [self.hisDatas insertObject:self.searchBar.text atIndex:0];
            [self.hisDatas writeToFile:SearchHistoryPath atomically:YES];
            
            [self.historyRecordBgView removeFromSuperview];
            [self SetUpHistoryRecord];
            [self.hotSearchBgView removeFromSuperview];
            [self SetUpHotSearch];
            
            self.searchBar.text = @"";
            [self.searchBar resignFirstResponder];
        }
        
    }else{
        NSLog(@"搜索内容不能为空");
    }
    [self.searchBar resignFirstResponder];

}

- (void)SearchAction {
    NSLog(@"这是搜索结果---%@",self.datas);
}

- (NSMutableArray *)hisDatas {
    if (_hisDatas == nil) {
        _hisDatas = [NSMutableArray arrayWithContentsOfFile:SearchHistoryPath];
        if (_hisDatas == nil) {
            _hisDatas = [[NSMutableArray alloc] init];
        }
    }
    return _hisDatas;
}

/** 模拟数据,懒加载方法 */
- (NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        if (self.hisDatas.count > 0) {
            [_datas addObject:self.hisDatas];
        }
    }
    return _datas;
}

@end
