//
//  MCSubLine.m
//  GraphChart
//
//  Created by LiuMingchuan on 15/10/12.
//  Copyright © 2015年 LMC. All rights reserved.
//

#import "MCSubLine.h"
#import "MCLineNodeBubble.h"

@implementation MCSubLine {
    /**
     *  第一点y
     */
    CGFloat _y1;
    /**
     *  第二点y
     */
    CGFloat _y2;
}

/**
 *  父视图初始化
 *
 *  @param frame 视图布局frame
 *
 *  @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:0];
    }
    return self;
}

/**
 *  绘制
 *
 *  @param rect 布局rect
 */
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, self.frame.size.height-_y1);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height-_y2);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetAllowsAntialiasing(context, YES);
    CGContextSetAllowsFontSmoothing(context, YES);
    CGContextSetLineWidth(context, 4);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextStrokePath(context);
    MCLineNodeBubble *node = [[MCLineNodeBubble alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    node.center = CGPointMake(self.frame.size.width, self.frame.size.height-_y2);
    [self addSubview:node];
    
}

/**
 *  点（y）设定
 *
 *  @param y1 第一点y
 *  @param y2 第二点y
 */
- (void)setY1:(CGFloat)y1 andY2:(NSInteger)y2{
    _y1 = y1;
    _y2 = y2;
    
}

@end
