//
//  AFGridTagsView.m
//  Demo
//
//  Created by Will on 2018/4/28.
//  Copyright © 2018年 fifyrio. All rights reserved.
//

#import "AFGridTagsView.h"

@implementation AFGridTagsViewLayout

@end

@implementation AFGridTagAppearance

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isTagEnabled = YES;
        self.tagFont = [UIFont systemFontOfSize:12];
        self.tagTextColor = [UIColor blackColor];
        self.tagBackgroundColor = [UIColor whiteColor];
        self.tagPadding = UIEdgeInsetsZero;
    }
    return self;
}

+ (CGFloat)getLabelWidthByText:(NSString*)text font:(UIFont *)font labelHeight:(CGFloat)labelHeight padding:(UIEdgeInsets)padding{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attrStr setAttributes:@{
                             NSFontAttributeName:font,
                             } range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, labelHeight )
                                        options:options
                                        context:nil];
    return rect.size.width + padding.left + padding.right;
}

@end

@interface AFGridTagsView ()

@property (nonatomic, strong) AFGridTagsViewLayout *layout;

@property (nonatomic, strong) AFGridTagAppearance *tagAppearance;

@end

@implementation AFGridTagsView

#pragma mark - Life cycle
- (instancetype)init
{
    AFGridTagAppearance *tagAppearance = [AFGridTagAppearance new];
    return [self initWithFrame:CGRectZero layout:nil tagAppearance:tagAppearance];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    AFGridTagAppearance *tagAppearance = [AFGridTagAppearance new];
    return [self initWithFrame:frame layout:nil tagAppearance:tagAppearance];
}

- (instancetype)initWithFrame:(CGRect)frame layout:(AFGridTagsViewLayout *)layout tagAppearance:(AFGridTagAppearance *)tagAppearance
{
    NSAssert(layout != nil, @"You should set layout");
    
    self = [super initWithFrame:frame];
    if (self) {
        _autoAdjustHeight = NO;
        _autoGridTagsViewHeight = 0;
        _layout = layout;
        _tagAppearance = tagAppearance;
    }
    return self;
}

#pragma mark - Public
- (void)setupWithTitles:(NSArray <NSString *>*)titles{
    NSArray *attrArray = [AFGridTagsView layoutAtttrbutesArrayWithLayout:self.layout tagAppearance:self.tagAppearance dataArray:titles];
    if (self.autoAdjustHeight) {
        self.autoGridTagsViewHeight = [AFGridTagsView gridTagsViewHeightWithAttrArray:attrArray];
    }
#warning 待替换为weakify
    __weak __typeof(self)weakSelf = self;
    [attrArray enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        #warning 待替换为strongify
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        CGRect frame = [obj CGRectValue];
        UIButton *tagView = [[UIButton alloc] initWithFrame:frame];
        [tagView setTitle:titles[idx] forState:UIControlStateNormal];
        [tagView setTitleColor:strongSelf.tagAppearance.tagTextColor forState:UIControlStateNormal];
        [tagView setBackgroundColor:strongSelf.tagAppearance.tagBackgroundColor];
        [tagView setUserInteractionEnabled:strongSelf.tagAppearance.isTagEnabled];
        [tagView.titleLabel setFont:strongSelf.tagAppearance.tagFont];
        
        [self addSubview:tagView];
    }];
    
    //更新父视图的约束
    if (self.autoGridTagsViewHeight && self.superview) {
        [self.superview setNeedsUpdateConstraints];
        [self.superview updateConstraintsIfNeeded];
    }
}

#pragma mark - Private
+ (CGFloat)gridTagsViewHeightWithAttrArray:(NSArray <NSValue *>*)attrArray{
    CGFloat gridHeight = 0;
    CGRect lastRect = [[attrArray lastObject] CGRectValue];
    gridHeight = lastRect.origin.y + lastRect.size.height;
    return gridHeight;
}

+ (NSArray <NSValue *>*)layoutAtttrbutesArrayWithLayout:(AFGridTagsViewLayout *)layout tagAppearance:(AFGridTagAppearance *)tagAppearance dataArray:(NSArray *)dataArray{
    CGFloat width = 0.0;
    CGFloat height = layout.itemSize.height;
    CGFloat x;
    CGFloat y;
    
    NSMutableArray *layoutAttributesArray = [NSMutableArray array];
    NSInteger count = dataArray.count;
    for (NSInteger i = 0; i < count; i ++) {
        if ([dataArray[i] isKindOfClass:[NSString class]]) {
            width = [AFGridTagAppearance getLabelWidthByText:dataArray[i] font:tagAppearance.tagFont labelHeight:layout.itemSize.height padding:tagAppearance.tagPadding];
        }
        
        if (i == 0) {
            x = 0;
            y = 0;
        }else{
            CGRect prevRect = [layoutAttributesArray[i - 1] CGRectValue];
            CGFloat finalRight = prevRect.origin.x + prevRect.size.width+ layout.interitemSpacing + width;
            if (finalRight > layout.gridViewWidth) {
                //换行
                x = 0;
                y = prevRect.origin.y + prevRect.size.height + layout.lineSpacing;
            }else{
                x = prevRect.origin.x + prevRect.size.width + layout.interitemSpacing;
                y = prevRect.origin.y;
            }
        }
        [layoutAttributesArray addObject:[NSValue valueWithCGRect:CGRectMake(x, y, width, height)]];
    }
    return layoutAttributesArray.copy;
}
@end
