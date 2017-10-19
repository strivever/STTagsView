//
//  STTagsView.h
//  STTagsViewDemo
//
//  Created by StriVever on 2017/9/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STTagsView : UIView
//标签对
@property (nonatomic, strong) NSMutableArray * tagsList;


/**
 标签标题颜色
 */
@property (nonatomic, strong) UIColor * textColor;
/**
 标签对字体
 */
@property (nonatomic, strong) UIFont * textFont;

/**
 正常背景颜色
 */
@property (nonatomic, strong) UIColor * tagNormalBackgroundColor;

/**
 选中背景颜色
 */
@property (nonatomic, strong) UIColor * tagSelectBackgroundColor;


/**
 边框颜色
 */
@property (nonatomic, strong) UIColor * borderColor;

/**
 选中边框颜色
 */
@property (nonatomic, strong) UIColor * selectBorderColor;

/**
 初始化方法

 @param frame 传入tagView坐标，需要确定 x,y width即可 比如 CGRectMake(0, 20, 375, 0)  height是自适应高度的
 @param tagsArray 需要渲染的标签对
 @param textColor 标签字体颜色
 @param font 标签字体大小
 @param normalBackgroundColor 正常的背景色
 @param borderColor bordercolor
 @param contentInset 调整标签 显示边距
 @param labelContentInsets 标签文本内容边距
 @param horizontalSpacing 每个标签的水平间距
 @param verticalSpacing 标签之间竖直间距
 @return 返回实例对象
 */
+ (instancetype)tagViewWithFrame:(CGRect)frame tagsArray:(NSArray *)tagsArray textColor:(UIColor *)textColor textFont:(UIFont *)font normalTagBackgroundColor:(UIColor *)normalBackgroundColor tagBorderColor:(UIColor *)borderColor contentInsets:(UIEdgeInsets)contentInset labelContentInsets:(UIEdgeInsets)labelContentInsets labelHorizontalSpacing:(CGFloat)horizontalSpacing labelVerticalSpacing:(CGFloat)verticalSpacing;


/**
 动态增加标签

 @param text 文本
 */
- (void)addTag:(NSString *)text;

/**
 删除tag
 */
- (void)removeTag:(NSString *)text;
@end
