//
//  STTagLayout.h
//  STTagsViewDemo
//
//  Created by StriVever on 2017/9/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class STTagFrame;
@interface STTagLayout : NSObject
@property (nonatomic, weak) STTagFrame * tagFrame;

@property (nonatomic, strong) UIFont * textFont;
@property (nonatomic, strong) NSString * content;

/**
 最大宽度
 */
@property (nonatomic, assign) CGFloat maxWidth;
/**
 最小高度
 */
@property (nonatomic, assign) CGFloat minHeight;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGRect frame;
+ (instancetype)layoutWithContent:(NSString *)text textFont:(UIFont *)font maxWidth:(CGFloat)maxWidth minHeight:(CGFloat)minHeight tagFrame:(STTagFrame *)tagFrame;

/**
 依赖上一个layout布局当前layout

 @param layout 上一个layout
 */
- (void)layoutWithLastLayout:(STTagLayout *)layout;
@end
