//
//  WWTagViewModel.m
//  tableView
//
//  Created by 吴伟 on 16/9/8.
//  Copyright © 2016年 Kingnet. All rights reserved.
//

#import "WWTagViewModel.h"

@implementation WWTagViewModel
- (instancetype)initWithTagArray:(NSArray *)tagArray gridViewWidth:(CGFloat)gridViewWidth interitemSpacing:(CGFloat)interitemSpacing lineSpaceing:(CGFloat)lineSpaceing tagHeight:(CGFloat)tagHeight tagPadding:(CGFloat)tagPadding tagFont:(UIFont *)tagFont
{
    self = [super init];
    if (self) {
        _tagArray = tagArray;
        _gridViewWidth = gridViewWidth;
        _interitemSpacing = interitemSpacing;
        _lineSpaceing = lineSpaceing;
        _tagHeight = tagHeight;
        _tagPadding = tagPadding;
        _tagFont = tagFont;
    }
    return self;
}
@end
