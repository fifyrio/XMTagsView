//
//  WWTagView.h
//  tableView
//
//  Created by 吴伟 on 16/9/8.
//  Copyright © 2016年 Kingnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWTagView : UIView
+ (CGFloat)getLabelWidthByText:(NSString*)text font:(UIFont *)font labelHeight:(CGFloat)labelHeight padding:(CGFloat)padding;
@property (nonatomic, copy) NSString *tagText;
@end
