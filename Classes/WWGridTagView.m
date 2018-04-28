//
//  WWGridTagView.m
//  tableView
//
//  Created by 吴伟 on 16/9/8.
//  Copyright © 2016年 Kingnet. All rights reserved.
//

#import "WWGridTagView.h"
#import "WWTagView.h"

@interface WWGridTagView()
@end

@implementation WWGridTagView
#pragma mark - Life cycle
- (void)willRemoveSubview:(UIView *)subview{
    [super willRemoveSubview:subview];
    self.viewModel = nil;
}
#pragma mark - Public
- (void)setupTags{
    NSArray *attrArray = [WWGridTagView layoutAtttrbutesArrayInViewModel:self.viewModel];
    WS(weakSelf);
    [attrArray enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect frame = [obj CGRectValue];
        WWTagView *tagView = [[WWTagView alloc] initWithFrame:frame];
        tagView.tagText = weakSelf.viewModel.tagArray[idx];
        [self addSubview:tagView];
    }];
}

+ (CGFloat)gridTagViewHeightWithViewModel:(WWTagViewModel *)viewModel{
    CGFloat gridHeight = 0;
    NSArray *attrArray = [self layoutAtttrbutesArrayInViewModel:viewModel];
    CGRect lastRect = [[attrArray lastObject] CGRectValue];
    gridHeight = lastRect.origin.y + lastRect.size.height;
    return gridHeight;
}
#pragma mark - Private
+ (NSArray <NSValue *>*)layoutAtttrbutesArrayInViewModel:(WWTagViewModel *)viewModel{
    CGFloat width;
    CGFloat height = viewModel.tagHeight;
    CGFloat x;
    CGFloat y;
    
    NSMutableArray *layoutAttributesArray = [NSMutableArray array];
    NSInteger count = viewModel.tagArray.count;
    for (NSInteger i = 0; i < count; i ++) {
        width = [WWTagView getLabelWidthByText:viewModel.tagArray[i] font:viewModel.tagFont labelHeight:viewModel.tagHeight padding:viewModel.tagPadding];
        if (i == 0) {
            x = 0;
            y = 0;
        }else{
            CGRect prevRect = [layoutAttributesArray[i - 1] CGRectValue];
            CGFloat finalRight = prevRect.origin.x + prevRect.size.width+ viewModel.interitemSpacing + width;
            if (finalRight > viewModel.gridViewWidth) {
                //换行
                x = 0;
                y = prevRect.origin.y + prevRect.size.height + viewModel.lineSpaceing;
            }else{
                x = prevRect.origin.x + prevRect.size.width + viewModel.interitemSpacing;
                y = prevRect.origin.y;
            }
        }
        [layoutAttributesArray addObject:[NSValue valueWithCGRect:CGRectMake(x, y, width, height)]];
    }
    return layoutAttributesArray.copy;
}
@end
