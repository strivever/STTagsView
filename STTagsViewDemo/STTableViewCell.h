//
//  STTableViewCell.h
//  STTagsViewDemo
//
//  Created by StriVever on 2017/9/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STTableViewCell : UITableViewCell
@property (nonatomic, strong) NSMutableArray * data;
+ (CGFloat)heightForCellWithDataArray:(NSArray *)tagList;
@end
