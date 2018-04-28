//
//  WWTagView.m
//  tableView
//
//  Created by 吴伟 on 16/9/8.
//  Copyright © 2016年 Kingnet. All rights reserved.
//

#import "WWTagView.h"


static CGFloat const tagFont = 10;
static NSString * const tagDefaultColor = @"999999";
static NSString * const bgDefaultColor = @"f5f5f5";
static CGFloat const bgRadius = 3;

@interface WWTagView()
@property (nonatomic, strong) UILabel *tagLabel;
@end

@implementation WWTagView
#pragma mark - Life cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    [self layoutIfNeeded];
    self.layer.cornerRadius = bgRadius;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor colorWithHexString:bgDefaultColor];
    
    UILabel *tagLabel = [[UILabel alloc] init];
    tagLabel.font = [UIFont systemFontOfSize:tagFont];
    tagLabel.textColor = [UIColor colorWithHexString:tagDefaultColor];
    tagLabel.textAlignment = NSTextAlignmentCenter;
    self.tagLabel = tagLabel;
    [self addSubview:tagLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.tagLabel.frame = self.bounds;
    self.tagLabel.text = self.tagText;
}

#pragma mark - Public
+ (CGFloat)getLabelWidthByText:(NSString*)text font:(UIFont *)font labelHeight:(CGFloat)labelHeight padding:(CGFloat)padding{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attrStr setAttributes:@{
                             NSFontAttributeName:font,
                             } range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, labelHeight )
                                        options:options
                                        context:nil];
    return rect.size.width + padding * 2;
}
@end
