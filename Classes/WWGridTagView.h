//
//  WWGridTagView.h
//  tableView
//
//  Created by 吴伟 on 16/9/8.
//  Copyright © 2016年 Kingnet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWTagViewModel.h"

@interface WWGridTagView : UIView
- (void)setupTags;

+ (CGFloat)gridTagViewHeightWithViewModel:(WWTagViewModel *)viewModel;

@property (nonatomic, strong) WWTagViewModel *viewModel;

@end
