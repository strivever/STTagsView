//
//  STTagFrame.h
//  STTagsViewDemo
//
//  Created by StriVever on 2017/9/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "STTagFrameProtocol.h"
@interface STTagFrame : NSObject <STTagFrameProtocol>

/**
 边距内容的边距
 */
@property (nonatomic, assign) UIEdgeInsets labelInsets;
/**
 tagView左右边距
 */
@property (nonatomic, assign) UIEdgeInsets insets;
/**
 左边距
 */
@property (nonatomic,assign) CGFloat leftMargin;
/**
 上边距
 */
@property (nonatomic,assign) CGFloat topMargin;
/**
 下边距
 */
@property (nonatomic,assign) CGFloat bottomMargin;
/**
 右边距
 */
@property (nonatomic,assign) CGFloat rightMargin;
/**
 两个空间之间水平间距
 */
@property (nonatomic, assign) CGFloat horizontalSpacing;
/**
 两个空间之间上下间距
 */
@property (nonatomic, assign) CGFloat verticalSpacing;
/**
 标签数组
 */
@property (nonatomic, strong) NSMutableArray<NSString *> * tagsArray;
@property (nonatomic, strong,readonly) NSMutableArray * layouts;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) UIFont * font;
@property (nonatomic, assign) CGFloat width;


+ (instancetype)tagFrameWithContentInsets:(UIEdgeInsets)contentInsets labelContentInsets:(UIEdgeInsets)labelContentInsets horizontalSpacing:(CGFloat)horizontalSpacing verticalSpacing:(CGFloat)verticalSpacing textFont:(UIFont *)font tagArray:(NSArray *)tagArray;
@end
