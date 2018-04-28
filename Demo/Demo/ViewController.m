//
//  ViewController.m
//  Demo
//
//  Created by wuw on 16/6/15.
//  Copyright © 2016年 fifyrio. All rights reserved.
//

#import "ViewController.h"
#import "AFGridTagsView.h"
#import <Masonry.h>
#import "AFTableViewCell.h"

#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

static NSString * const kAFTableViewCell = @"AFTableViewCell";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) AFGridTagsView *tagsView;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"Demo";
    
    [self setUpViews];
    
}
#pragma mark - Initialize
- (void)setUpViews{
    [self.view addSubview:self.tagsView];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

- (void)updateViewConstraints{
    WS(weakSelf);
    [self.tagsView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(weakSelf.tagsView.autoGridTagsViewHeight));
    }];
    [super updateViewConstraints];
}

- (AFGridTagsView *)tagsView{
    if (!_tagsView) {
        AFGridTagsViewLayout *layout = [AFGridTagsViewLayout new];
        layout.itemSize = CGSizeMake(0, 14);
        layout.interitemSpacing = 10;
        layout.lineSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
        layout.gridViewWidth = ScreenW;
        
        AFGridTagAppearance *appearance = [AFGridTagAppearance new];
        appearance.tagTextColor = [UIColor blueColor];
        appearance.tagFont = [UIFont systemFontOfSize:12];
        appearance.tagBackgroundColor = [UIColor grayColor];
        
        _tagsView = [[AFGridTagsView alloc] initWithFrame:CGRectZero layout:layout tagAppearance:appearance];
        _tagsView.autoAdjustHeight = YES;
    }
    return _tagsView;
}

#pragma mark -
- (IBAction)onclickRun:(id)sender {
    NSArray *array = @[@"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型", @"B2户型"];
    [self.tagsView setupWithTitles:array];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAFTableViewCell];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
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
