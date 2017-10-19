//
//  STTableViewCell.m
//  STTagsViewDemo
//
//  Created by StriVever on 2017/9/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import "STTableViewCell.h"
#import "STTagsView.h"
#import "STTagFrame.h"

#define kUIScreenSize [UIScreen mainScreen].bounds.size
#define kUIScreenWidth kUIScreenSize.width
#define kUIScreenHeight kUIScreenSize.height


@interface STTableViewCell ()
@property (nonatomic, strong) STTagsView * tagView;
@end
@implementation STTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _tagView = [STTagsView tagViewWithFrame:CGRectMake(0, 20, 375, 0) tagsArray:@[] textColor:[UIColor blueColor] textFont:[UIFont systemFontOfSize:15] normalTagBackgroundColor:[UIColor whiteColor] tagBorderColor:[UIColor lightGrayColor] contentInsets:UIEdgeInsetsMake(10, 10, 10, 10) labelContentInsets:UIEdgeInsetsMake(2, 5, 2, 5) labelHorizontalSpacing:10 labelVerticalSpacing:10];
        [self addSubview:_tagView];
    }
    return  self;
}
- (void)setData:(NSMutableArray *)data{
    _data = data;
    _tagView.tagsList = _data;
    [_tagView layoutSubviews];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (CGFloat)heightForCellWithDataArray:(NSArray *)tagList{
    STTagFrame * tagFrame = [STTagFrame tagFrameWithContentInsets:UIEdgeInsetsMake(10, 10, 10, 10) labelContentInsets:UIEdgeInsetsMake(2, 5, 2, 5) horizontalSpacing:10 verticalSpacing:10 textFont:[UIFont systemFontOfSize:15] tagArray:tagList];
    tagFrame.width = kUIScreenWidth ;
    tagFrame.tagsArray = tagList.mutableCopy;
    CGFloat height = 0 + tagFrame.height;
    return  height;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _tagView.frame = CGRectMake(0, 0, kUIScreenWidth, MAX(0, _tagView.frame.size.height));
}
@end
