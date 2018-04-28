//
//  AFTableViewCell.m
//  Demo
//
//  Created by Will on 2018/4/28.
//  Copyright © 2018年 fifyrio. All rights reserved.
//

#import "AFTableViewCell.h"
#import "AFGridTagsView.h"

@interface AFTableViewCell ()

@property (nonatomic, strong) AFGridTagsView *tagsView;

@end

@implementation AFTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.tagsView];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    return self;
}

- (void)updateConstraints{
    [self.tagsView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(100);
        make.left.right.equalTo(self);
        make.height.equalTo(@(self.tagsView.autoGridTagsViewHeight));
    }];
    [super updateConstraints];
}

#pragma mark -
- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self.tagsView setupWithTitles:dataArray];
}

#pragma mark -
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

@end
