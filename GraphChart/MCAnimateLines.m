//
//  MCAnimateLines.m
//  GraphChart
//
//  Created by LiuMingchuan on 15/10/12.
//  Copyright © 2015年 LMC. All rights reserved.
//

#import "MCAnimateLines.h"
#import "MCSubLine.h"
#import "MCAnimateLinesDataSourceDelegate.h"


@implementation MCAnimateLines {
    /**
     *  折线宽度
     */
    CGFloat _subLineWidth;
    /**
     *  屏幕显示折线条数
     */
    NSInteger _countOfLines;
    /**
     *  折线数据数组（y）
     */
    NSMutableArray *_dataSource;
    /**
     *  移动用折线视图数组
     */
    NSMutableArray *_subLinesArray;
    /**
     *  折线数据数组当前的index
     */
    NSInteger _indexOfDrawingLine;
    /**
     *  父视图size
     */
    CGSize _size;
}

/**
 *  父视图初始化
 *
 *  @param frame 布局frame
 *
 *  @return 实例
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _size = frame.size;
        _countOfLines = 1;
        _indexOfDrawingLine = 0;
        
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor colorWithRed:0 green:.8 blue:.5 alpha:1];
    }
    return self;
}
/**
 *  绘制折线
 */
- (void)drawLines {
    _dataSource = [_delegate getData];
    
    if (_indexOfDrawingLine < _dataSource.count-1) {
        //数据的个数小于折线的条数
        if (_indexOfDrawingLine < _countOfLines) {
            MCSubLine *subLine = [[MCSubLine alloc]initWithFrame:CGRectMake(_indexOfDrawingLine*_subLineWidth+5, 0, _subLineWidth, _size.height)];
            CGFloat y1 = [[_dataSource objectAtIndex:_indexOfDrawingLine] floatValue];
            CGFloat y2 = [[_dataSource objectAtIndex:_indexOfDrawingLine+1]floatValue];
            [subLine setY1:y1 andY2:y2];
            subLine.alpha = 0;
            [self addSubview:subLine];
            [self sendSubviewToBack:subLine];
            [_subLinesArray addObject:subLine];
            [UIView animateWithDuration:1 animations:^{
                subLine.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
            _indexOfDrawingLine ++;
            
        } else {
            //数据的个数大于折线的条数
            //我们首先将所有的折线视图左移一个折线位置，将_subLinesArray中第一个折线移除（父视图中），然后绘制下一个折线，并添加到_subLinesArray中
            
            [UIView animateWithDuration:.5 animations:^{
                for (MCSubLine *line in _subLinesArray) {
                    [line setFrame:CGRectMake(line.frame.origin.x-_subLineWidth, 0, _subLineWidth, _size.height)];
                }
            } completion:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:0.5 animations:^{
                        ((MCSubLine*)[_subLinesArray objectAtIndex:0]).alpha = 0;
                    } completion:^(BOOL finished) {
                        if (finished) {
                            [[_subLinesArray objectAtIndex:0]removeFromSuperview];
                            [_subLinesArray removeObjectAtIndex:0];
                        }
                    }];
                    
                    MCSubLine *subLine = [[MCSubLine alloc]initWithFrame:CGRectMake((_countOfLines-1)*_subLineWidth+5, 0, _subLineWidth, _size.height)];
                    CGFloat y1 = [[_dataSource objectAtIndex:_indexOfDrawingLine] floatValue];
                    CGFloat y2 = [[_dataSource objectAtIndex:_indexOfDrawingLine+1]floatValue];
                    [subLine setY1:y1 andY2:y2];
                    subLine.alpha = 0;
                    [self addSubview:subLine];
                    [self sendSubviewToBack:subLine];
                    [_subLinesArray addObject:subLine];
                    _indexOfDrawingLine++;
                    [UIView animateWithDuration:.5 animations:^{
                        subLine.alpha = 1;
                    } completion:^(BOOL finished) {
                        
                    }];
                }
            }];
            
            
        }
        
    }
    
}
/**
 * 画面中折线的条数
 *
 *  @param count 折线条数
 */
- (void)setCountOfLines:(NSInteger)count {
    _countOfLines = count;
    _subLineWidth = (_size.width-10)/count;
    _subLinesArray = [NSMutableArray arrayWithCapacity:count+1];
}

@end
