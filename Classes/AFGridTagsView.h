//
//  AFGridTagsView.h
//  Demo
//
//  Created by Will on 2018/4/28.
//  Copyright © 2018年 fifyrio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFGridTagsViewLayout : NSObject

@property (nonatomic, assign) CGFloat lineSpacing;

@property (nonatomic, assign) CGFloat interitemSpacing;

@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic, assign) UIEdgeInsets sectionInset;

@property (nonatomic, assign) CGFloat gridViewWidth;//整个gridView宽度

@end

@interface AFGridTagAppearance : NSObject

@property (nonatomic, strong) UIFont *tagFont;//default is [UIFont systemFontOfSize:12]

@property (nonatomic, strong) UIColor *tagTextColor;//default is [UIColor blackColor]

@property (nonatomic, strong) UIColor *tagBackgroundColor;//default is [UIColor whiteColor]

@property (nonatomic, assign) UIEdgeInsets tagPadding;//Tag's inner padding

@property (nonatomic, assign) BOOL isTagEnabled;//userInteractionEnabled, default is YES

@end

@interface AFGridTagsView : UIView

@property (nonatomic, assign) BOOL autoAdjustHeight;//automatically adjust height will be set, default is NO;

@property (nonatomic, assign) CGFloat autoGridTagsViewHeight;//If autoAdjustHeight is YES, this is the gridTagsViewHeight, default is 0

- (instancetype)initWithFrame:(CGRect)frame layout:(AFGridTagsViewLayout *)layout tagAppearance:(AFGridTagAppearance *)tagAppearance;

- (void)setupWithTitles:(NSArray <NSString *>*)titles;

@end
