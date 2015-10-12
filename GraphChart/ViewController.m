//
//  ViewController.m
//  GraphChart
//
//  Created by LiuMingchuan on 15/10/11.
//  Copyright © 2015年 LMC. All rights reserved.
//

#import "ViewController.h"
#import "MCAnimateLines.h"
#import "MCAnimateLinesDataSourceDelegate.h"


@interface ViewController (){
    /**
     *  折线图
     */
    MCAnimateLines *lineChart;
    /**
     *  折线图数据数组
     */
    NSMutableArray *data;
}

@end

@implementation ViewController

/**
 *  视图加载
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    lineChart = [[MCAnimateLines alloc]initWithFrame:CGRectMake(5, 164, self.view.frame.size.width-10, 300)];
    [lineChart setCountOfLines:6];
    lineChart.delegate = self;
    [self.view addSubview:lineChart];
    data = [[NSMutableArray alloc]init];
    NSTimer *timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(drawLine) userInfo:nil repeats:YES];
    [timer fire];
    
}

/**
 *  定时器模拟数据源
 */
- (void)drawLine {
    CGFloat y = arc4random()%150+80;
    NSLog(@"%f",y);
    [data addObject:[NSString stringWithFormat:@"%f",y]];
    [lineChart drawLines];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  折线数据数组
 *
 *  @return 数据数组
 */
-(NSMutableArray *)getData{
    return data;
}
@end
