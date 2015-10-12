//
//  MCAnimateLines.h
//  GraphChart
//
//  Created by LiuMingchuan on 15/10/12.
//  Copyright © 2015年 LMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MCAnimateLinesDataSourceDelegate;

@interface MCAnimateLines : UIView

@property (nonatomic) id<MCAnimateLinesDataSourceDelegate> delegate;

/**
 *  绘制折线
 */
- (void)drawLines;

/**
 * 画面中折线的条数
 *
 *  @param count 折线条数
 */
- (void)setCountOfLines:(NSInteger)count;

    
@end
