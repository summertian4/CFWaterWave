//
//  ZLYWaterwave.m
//  hulk
//
//  Created by 周凌宇 on 16/4/22.
//  Copyright © 2016年 周凌宇. All rights reserved.
//

#import "ZLYWaterWave.h"
@interface ZLYWaterWave ()
@property (nonatomic, assign) CGRect  frame;
// 最高或者最低是反向波动标识
@property (nonatomic, assign) BOOL    waveUp;
/** 波浪曲线 */
@property (nonatomic, assign) CGFloat waveCurve;
@property (nonatomic, assign) CGFloat waveSpeed;

@end

@implementation ZLYWaterWave

#pragma mark - ===============================Life Cycle===============================
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super init]) {
        [self settingWithFrame:frame];
    }
    return self;
}

- (void)settingWithFrame:(CGRect)frame{
    self.frame = frame;
    self.waveCurve = 1.5;
    self.waveSpeed = 0;
    self.waveUp = NO;
    // 每次0.05秒执行一次动画
    [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(waving) userInfo:nil repeats:YES];
}

/**
 *  开始起波浪~
 */
-(void)waving {
    self.waveCurve += self.waveUp? 0.01f : -0.01f;
    if (self.waveCurve <= 1.f) {
        self.waveUp = YES;
    }else if (self.waveCurve >= 1.5f){
        self.waveUp = NO;
    }
    self.waveSpeed += 0.1f;
    
    [self createPath];
}

/**
 *  创建path回调给代理
 */
- (void)createPath {
    UIBezierPath * path = [[UIBezierPath alloc] init];
    CGFloat  waterDepthY = (1 - (self.waterDepth > 1.f? 1.f : self.waterDepth)) * self.frame.size.height;
    CGFloat y = waterDepthY;
    [path moveToPoint:CGPointMake(0, y)];
    path.lineWidth = 1;

    for (CGFloat x = 0; x <= self.frame.size.width; x++) {
        y = self.waveCurve * sin(x/180*M_PI + 4* self.waveSpeed/M_PI) * 5 + waterDepthY;
        [path addLineToPoint:CGPointMake(x, y)];
    }
    [path addLineToPoint:CGPointMake(self.frame.size.width, y)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [path closePath];
    
    if ([self.delegate respondsToSelector:@selector(waterWave:wavePath:)]) {
        [self.delegate waterWave:self wavePath:path];
    }
}

@end
