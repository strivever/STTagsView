//
//  STTagLayout.m
//  STTagsViewDemo
//
//  Created by StriVever on 2017/9/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import "STTagLayout.h"
#import "STTagFrame.h"
@interface STTagLayout ()
@property (nonatomic, assign) CGFloat st_top;
@property (nonatomic, assign) CGFloat st_left;
@property (nonatomic, assign) CGFloat st_right;
@property (nonatomic, assign) CGFloat st_bottom;
@end
static const CGFloat __maxWidth = 320;
static const CGFloat __minHeight = 20;
@implementation STTagLayout
+ (instancetype)layoutWithContent:(NSString *)text textFont:(UIFont *)font maxWidth:(CGFloat)maxWidth minHeight:(CGFloat)minHeight tagFrame:(STTagFrame *)tagFrame{
    STTagLayout * layout = [[STTagLayout alloc]init];
    layout.minHeight = minHeight;
    layout.maxWidth = maxWidth;
    layout.textFont = font;
    layout.tagFrame = tagFrame;
    layout.content = text;
    return layout;
}
- (instancetype)initWithContent:(NSString *)content{
    if (self = [super init]) {
        self.maxWidth = __maxWidth;
        self.minHeight = __minHeight;
        self.textFont = [UIFont systemFontOfSize:17];
        self.content = content;
    }
    return self;
}

- (void)setContent:(NSString *)content{
    if (![_content isEqualToString:content]) {
        _content = content;
        [self st_layoutSize];
    }else{
        NSLog(@"重用");
    }
    
}
- (CGSize)st_layoutSize{
    CGFloat contentMaxWidth = self.maxWidth - self.tagFrame.labelInsets.left - self.tagFrame.labelInsets.right;
    //计算的是纯文本的宽高
    CGSize size = [_content boundingRectWithSize:CGSizeMake(MAXFLOAT, self.minHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.textFont} context:nil].size;
    //加上边距
    size = CGSizeMake(size.width + self.tagFrame.labelInsets.left + self.tagFrame.labelInsets.right, size.height + self.tagFrame.labelInsets.bottom + self.tagFrame.labelInsets.top);
    //超过最大 宽度
    if (size.width >= self.maxWidth) {
        self.width = self.maxWidth;
        size = [_content boundingRectWithSize:CGSizeMake(contentMaxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.textFont} context:nil].size;
        size = CGSizeMake(size.width + self.tagFrame.labelInsets.left + self.tagFrame.labelInsets.right, size.height + self.tagFrame.labelInsets.bottom + self.tagFrame.labelInsets.top);
        self.height = size.height;
    }else{
        self.width = size.width;
        self.height = size.height;
    }
    self.size = CGSizeMake(self.width, self.height);
    return self.size;
}
- (void)layoutWithLastLayout:(STTagLayout *)layout{
    if (layout) {
        if (self.width >= self.maxWidth) {
            //超过一个屏幕宽度  换行
            self.x = self.tagFrame.leftMargin;
            self.y = layout.st_bottom + self.tagFrame.verticalSpacing;
        }else{
            CGFloat layoutRight = layout.st_right + self.tagFrame.horizontalSpacing + self.width;
            if (layoutRight <= self.maxWidth) {
                //没有超出规定大小
                self.x =  layout.st_right + self.tagFrame.horizontalSpacing;
                self.y = layout.y;
            }else{
                //换行
                self.x = self.tagFrame.leftMargin;
                self.y = layout.st_bottom + self.tagFrame.verticalSpacing;
            }
        }
    }else{
        //布局第一个
        self.x = self.tagFrame.leftMargin;
        self.y = self.tagFrame.bottomMargin;
    }
}

- (CGRect)frame{
    return CGRectMake(self.x, self.y, self.width, self.height);
}

- (CGFloat)st_right{
    return  self.x + self.width;
}
- (CGFloat)st_bottom{
    return self.y + self.height;
}
- (CGFloat)st_left{
    return self.x;
}
- (CGFloat)st_top{
    return self.y;
}

@end
