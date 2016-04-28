//
//  WaterWeave.h
//  hulk
//
//  Created by huangyuan on 4/20/16.
//  Copyright © 2016 WangZhaoYun. All rights reserved.
//  水波工具，核心原理是创建波浪形Path，通过添加遮盖形成波浪效果

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CFWaterWave;
@protocol CFWaterWaveDelegate <NSObject>
/**
 *  返回贝塞尔曲线路径
 *
 *  @param waterWave 水波工具
 *  @param path      路径
 */
- (void)waterWave:(CFWaterWave *)waterWave wavePath:(UIBezierPath *)path;
@end

@interface CFWaterWave : NSObject
- (id)initWithFrame:(CGRect)frame;
/**
 *  水深占比，0 to 1;
 */
@property(nonatomic, assign)CGFloat waterDepth;
/** 代理 */
@property (nonatomic, weak) id<CFWaterWaveDelegate> delegate;

@end
