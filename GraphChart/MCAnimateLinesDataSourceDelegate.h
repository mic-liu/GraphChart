//
//  MCAnimateLinesDataSourceDelegate.h
//  GraphChart
//
//  Created by LiuMingchuan on 15/10/12.
//  Copyright © 2015年 LMC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MCAnimateLinesDataSourceDelegate <NSObject>

/**
 *  折线数据
 *
 *  @return 数据数组
 */
- (NSMutableArray *)getData;

@end
