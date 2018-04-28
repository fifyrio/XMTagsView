//
//  ViewController.m
//  Demo
//
//  Created by wuw on 16/6/15.
//  Copyright © 2016年 fifyrio. All rights reserved.
//

#import "ViewController.h"
#import "AFTableViewCell.h"

static NSString * const kAFTableViewCell = @"AFTableViewCell";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (nonatomic, retain) NSMutableArray *dataArray;

@end

@implementation ViewController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"Demo";
    
    self.dataArray = @[].mutableCopy;
    [self setUpViews];
    
}
#pragma mark - Initialize
- (void)setUpViews{
    [self.view insertSubview:self.tableView belowSubview:self.btn];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark -
- (IBAction)onclickRun:(id)sender {
    
    NSArray *array = @[@"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型"];
    [self.dataArray addObjectsFromArray:array];
    [self.tableView reloadData];
    /*
    NSArray *array = @[@"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型"];
    [self.tagsView setupWithTitles:array];
     */
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAFTableViewCell];
    if (cell == nil) {
        cell = [[AFTableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:kAFTableViewCell];
    }
    cell.dataArray = self.dataArray.copy;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark -
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[AFTableViewCell class] forCellReuseIdentifier:kAFTableViewCell];
    }
    return _tableView;
}

@end
