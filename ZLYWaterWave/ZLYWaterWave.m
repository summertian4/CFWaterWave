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
/** 相位 */
@property (nonatomic, assign) CGFloat phase;
@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation ZLYWaterWave

#pragma mark - ===============================Life Cycle===============================

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super init]) {
        [self settingWithFrame:frame];
    }
    return self;
}

#pragma mark - ===============================Public===============================

/**
 开始波动
 */
- (void)startAnimation {
    [self stopAnimation];
    // 每次0.05秒执行一次动画
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(waving)];
    link.frameInterval = 0.05;
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.displayLink = link;
}

/**
 停止波动
 */
- (void)stopAnimation {
    self.displayLink.paused = YES;
    [self.displayLink invalidate];
    self.displayLink = nil;
}

#pragma mark - ===============================Private===============================

- (void)settingWithFrame:(CGRect)frame{
    self.frame = frame;
    self.amplitude = 5;
    self.phase = 0;
    self.speed = 0.05f;
    self.angularVelocity = 1.0f;
    [self startAnimation];
}

/**
 *  开始起波浪~
 */
-(void)waving {
    
    self.phase += self.speed;
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

    for (double x = 0; x <= self.frame.size.width; x++) {
        // y=Asin(ωx+φ)+k
        // A——振幅，当物体作轨迹符合正弦曲线的直线往复运动时，其值为行程的1/2。
        // (ωx+φ)——相位，反映变量y所处的状态。
        // φ——初相，x=0时的相位；反映在坐标系上则为图像的左右移动。
        // k——偏距，反映在坐标系上则为图像的上移或下移。
        // ω——角速度， 控制正弦周期(单位角度内震动的次数)。
        y = self.amplitude * sin(x / 180 * M_PI * self.angularVelocity + self.phase / M_PI * 4) + waterDepthY;
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
