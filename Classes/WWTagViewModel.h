//
//  WWTagViewModel.h
//  tableView
//
//  Created by 吴伟 on 16/9/8.
//  Copyright © 2016年 Kingnet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWTagViewModel : NSObject
- (instancetype)initWithTagArray:(NSArray *)tagArray gridViewWidth:(CGFloat)gridViewWidth interitemSpacing:(CGFloat)interitemSpacing lineSpaceing:(CGFloat)lineSpaceing tagHeight:(CGFloat)tagHeight tagPadding:(CGFloat)tagPadding tagFont:(UIFont *)tagFont;

@property (nonatomic, strong) UIFont *tagFont;//tag字体

@property (nonatomic, assign) CGFloat gridViewWidth;//整个gridView宽度

@property (nonatomic, assign) CGFloat interitemSpacing;//列间距

@property (nonatomic, assign) CGFloat lineSpaceing;//行间距

@property (nonatomic, assign) CGFloat tagHeight;//tag高度

@property (nonatomic, assign) CGFloat tagPadding;//tag里label的padding

@property (nonatomic, copy) NSArray *tagArray;//标签字符串数组
@end
