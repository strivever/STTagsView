//
//  STTagFrame.m
//  STTagsViewDemo
//
//  Created by StriVever on 2017/9/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import "STTagFrame.h"
#import "STTagLayout.h"

#define kUIScreenSize [UIScreen mainScreen].bounds.size
#define kUIScreenWidth kUIScreenSize.width
#define kUIScreenHeight kUIScreenSize.height
@interface STTagFrame()
@property (nonatomic, strong)NSMutableArray * reusingLayoutArray;
@end
@implementation STTagFrame
+ (instancetype)tagFrameWithContentInsets:(UIEdgeInsets)contentInsets labelContentInsets:(UIEdgeInsets)labelContentInsets horizontalSpacing:(CGFloat)horizontalSpacing verticalSpacing:(CGFloat)verticalSpacing textFont:(UIFont *)font tagArray:(NSArray *)tagArray{
    STTagFrame * tagFrame = [[STTagFrame alloc]init];
    tagFrame.insets = contentInsets;
    tagFrame.horizontalSpacing = horizontalSpacing;
    tagFrame.verticalSpacing = verticalSpacing;
    tagFrame.font = font;
    tagFrame.labelInsets = labelContentInsets;
    tagFrame.tagsArray = [NSMutableArray arrayWithArray:tagArray];
    tagFrame.reusingLayoutArray = @[].mutableCopy;
    return tagFrame;
}
- (void)setInsets:(UIEdgeInsets)insets{
    _insets = insets;
    self.leftMargin = _insets.left;
    self.topMargin = _insets.top;
    self.rightMargin = _insets.right;
    self.bottomMargin = _insets.bottom;
}
- (void)setWidth:(CGFloat)width{
    if (width != _width) {
        _width = width;
        [self refreshLayout];
    }
}
- (void)setTagsArray:(NSMutableArray<NSString *> *)tagsArray{
    _tagsArray = tagsArray;
    if (_width > 0) {
        [self refreshLayout];
    }
}
//准备布局
- (void)st_preLayout{
    if (_layouts) {
        [self.reusingLayoutArray addObjectsFromArray:_layouts];
    }
    _layouts = [NSMutableArray array];
    [self.tagsArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self createLayoutWithContent:obj];
    }];
}

- (void)createLayoutWithContent:(NSString *)content{
    STTagLayout * layout = nil;
    if (self.reusingLayoutArray.count > 0){
        layout = self.reusingLayoutArray[0];

        layout.maxWidth = self.width - (self.leftMargin + self.rightMargin);
        layout.content = content;
        [self.layouts addObject:layout];
        [self.reusingLayoutArray removeObject:layout];
    }else{
        layout = [STTagLayout layoutWithContent:[NSString stringWithFormat:@"%@",content] textFont:self.font maxWidth:self.width - (self.leftMargin + self.rightMargin) minHeight:20 tagFrame:self];
        [self.layouts addObject:layout];
    }
    
}
//开始布局
- (void)st_layoutSubViews{
    //进行布局
    STTagLayout * lastLayout = nil;
    for (int i = 0; i < self.layouts.count; i ++) {
        STTagLayout * layout = self.layouts[i];
        [layout layoutWithLastLayout:lastLayout];
        lastLayout = layout;
    }
}
- (CGFloat)height{
    STTagLayout * layout = self.layouts.lastObject;
    return  layout.y + layout.height + self.bottomMargin;
}
#pragma mark ---STTagFrameProtocol
- (void)addTagWithContent:(NSString *)content{
    if (content.length > 0) {
        [self.tagsArray addObject:content];
        STTagLayout * lastLayout = self.layouts.lastObject;
        [self createLayoutWithContent:content];
        STTagLayout * layout = self.layouts.lastObject;
        [layout layoutWithLastLayout:lastLayout];
    }
}
- (void)removeTagWithIndex:(NSInteger)idx{
    [self.tagsArray removeObjectAtIndex:idx];
    [self.layouts removeObjectAtIndex:idx];
}
//刷新布局
- (void)refreshLayout{
    [self st_preLayout];
    [self st_layoutSubViews];
}
@end
