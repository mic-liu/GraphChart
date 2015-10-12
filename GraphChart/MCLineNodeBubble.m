//
//  MCLineNodeBubble.m
//  GraphChart
//
//  Created by LiuMingchuan on 15/10/12.
//  Copyright © 2015年 LMC. All rights reserved.
//

#import "MCLineNodeBubble.h"

@implementation MCLineNodeBubble

/**
 *  视图初始化
 *
 *  @param frame 布局frame
 *
 *  @return 实例
 */
-(instancetype)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = frame.size.width/2;
    }
    return self;
}

@end
