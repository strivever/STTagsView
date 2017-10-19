//
//  STTagFrameProtocol.h
//  STTagsViewDemo
//
//  Created by StriVever on 2017/9/19.
//  Copyright © 2017年 StriVever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol STTagFrameProtocol <NSObject>
- (void)addTagWithContent:(NSString *)content;
- (void)removeTagWithIndex:(NSInteger)idx;
- (void)refreshLayout;
@end
