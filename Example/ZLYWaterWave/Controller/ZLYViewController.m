//
//  ZLYViewController.m
//  ZLYWaterWave
//
//  Created by 周凌宇 on 16/4/22.
//  Copyright © 2016年 周凌宇. All rights reserved.
//

#import "ZLYViewController.h"
#import "ZLYWaterWave.h"
#import "MJRefresh.h"
#import "Masonry.h"

#define kSCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define kSCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width

@interface ZLYViewController () <ZLYWaterWaveDelegate>

/** 白色图片 */
@property (nonatomic, weak  ) UIImageView *pic_white;
/** 红色图片 */
@property (nonatomic, weak  ) UIImageView *pic_red;
/** 水波工具 */
@property (nonatomic, strong) ZLYWaterWave *waterWave;

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *stopButton;

@end

@implementation ZLYViewController

#pragma mark - ========================Life Cycle========================

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startButton];
    [self stopButton];
    [self pic_white];
    [self pic_red];
    [self waterWave];
    self.waterWave.waterDepth = 0.5;
}

- (void)start {
    [self.waterWave startAnimation];
}

- (void)stop {
    [self.waterWave stopAnimation];
}

#pragma mark - ========================ZLYWaterWave Delegate========================

- (void)waterWave:(ZLYWaterWave *)waterWave wavePath:(UIBezierPath *)path {
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = path.CGPath;
    self.pic_red.layer.mask = maskLayer;
}

#pragma mark - ========================Getter Setter========================

- (ZLYWaterWave *)waterWave {
    if (_waterWave == nil) {
        CGRect frame = CGRectMake(self.pic_red.mj_x, self.pic_red.mj_y, self.pic_red.mj_w, self.pic_red.mj_h);
        _waterWave = [[ZLYWaterWave alloc] initWithFrame:frame];
        _waterWave.delegate = self;
    }
    return _waterWave;
}

- (UIImageView *)pic_white {
    if (_pic_white == nil) {
        UIImageView *pic_white = [[UIImageView alloc] init];
        pic_white.frame        = CGRectMake((kSCREEN_WIDTH - 150) / 2, (kSCREEN_HEIGHT - 150) / 2, 150, 150);
        pic_white.image        = [UIImage imageNamed:@"pic_white"];
        [self.view addSubview:pic_white];
        _pic_white             = pic_white;
    }
    return _pic_white;
}

- (UIImageView *)pic_red {
    if (_pic_red == nil) {
        UIImageView *pic_red = [[UIImageView alloc] init];
        pic_red.frame        = self.pic_white.frame;
        pic_red.image        = [UIImage imageNamed:@"pic_red"];
        [self.view addSubview:pic_red];
        _pic_red             = pic_red;
    }
    return _pic_red;
}

- (UIButton *)startButton {
    if (_startButton == nil) {
        _startButton = [[UIButton alloc] init];
        _startButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_startButton setTitle:@"开始" forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        _startButton.backgroundColor = [UIColor colorWithRed:0 green:0.7 blue:0.5 alpha:1];
        [self.view addSubview:_startButton];
        [_startButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.right.equalTo(self.stopButton.mas_left).offset(-10);
            make.bottom.equalTo(self.view).offset(-10);
            make.height.mas_equalTo(30);
        }];
    }
    return _startButton;
}

- (UIButton *)stopButton {
    if (_stopButton == nil) {
        _stopButton = [[UIButton alloc] init];
        _stopButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_stopButton setTitle:@"停止" forState:UIControlStateNormal];
        [_stopButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
        _stopButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.38 blue:0.38 alpha:1];
        [self.view addSubview:_stopButton];
        [_stopButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.startButton);
            make.right.equalTo(self.view).offset(-10);
            make.bottom.equalTo(self.startButton);
            make.height.equalTo(self.startButton);
        }];
    }
    return _stopButton;
}

@end
