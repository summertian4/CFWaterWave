# 简介

ZLYWaterWave是一个简单好用的iOS水波效果工具，可以让你的APP更加好看有趣

![ZLYWaterWave效果展示](http://7xt4xp.com2.z0.glb.clouddn.com/github_CFWaterWave_show_01.gif)

# 原理简介

ZLYWaterWave的原理很简单，我们用 Example 里的工程做简介。(这里首先要感谢 @hy，我敬爱的前辈，最初是从他这里学习的水波效果原理)

![白色图片](http://7xt4xp.com2.z0.glb.clouddn.com/github_CFWaterWave_pic_white.png-w100)
![红色图片](http://7xt4xp.com2.z0.glb.clouddn.com/github_CFWaterWave_pic_red.png-w100)
![叠加添加遮盖效果](http://7xt4xp.com2.z0.glb.clouddn.com/github_CFWaterWave_img_03.png-w100)

1. 首先准备两张图片
2. 将两张图放在重叠的位置
3. 将其中一张图片加上波浪形的遮盖
4. 如果波浪形的遮盖是动态再变化的的，就可以形成动态的波浪
5. ZLYWaterWave 就是为你提供好了动态波浪的 Path，你只需要在回调中加入遮盖即可
6. 如果你还是晕晕的，那就直接看 Example 吧，相信你瞬间就会明白的

# 安装

1. CocoaPods

   ```
   pod ‘ZLYWaterWave’
   ```

2. 直接安装

   直接拽入 `ZLYWaterWave.h `和 `ZLYWaterWave.m` 文件

# 使用ZLYWaterWave

1. 创建ZLYWaterWave对象

```objc
- (ZLYWaterWave *)waterWave {
    if (_waterWave == nil) {
        // 给定的frame和你的图片frame一致即可
        _waterWave = [[ZLYWaterWave alloc] initWithFrame:self.pic_red.frame];
        _waterWave.delegate = self;
    }
    return _waterWave;
}
```

2. 实现好代理，在代理中给你想要实现水波纹的图片加上贝塞尔路径生成的遮盖

```objc
- (void)waterWave:(ZLYWaterWave *)waterWave wavePath:(UIBezierPath *)path {
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = path.CGPath;
    // 添加遮盖
    self.pic_red.layer.mask = maskLayer;
}
```

3. ZLYWaterWave 提供以下参数设置：
	
```objc
/** 水深占比，0 to 1; */
@property(nonatomic, assign)CGFloat waterDepth;

/** 波浪速度，默认 0.05f */
@property (nonatomic, assign) CGFloat speed;

/** 波浪幅度 */
@property (nonatomic, assign) CGFloat amplitude;

/** 波浪紧凑程度（角速度），默认 1.0 */
@property (nonatomic, assign) CGFloat angularVelocity;
```

4. 提供两个控制动画的方法：

```objc
/**
 开始波动
 */
- (void)startAnimation;

/**
 停止波动
 */
- (void)stopAnimation;
```

# 效果展示

![ZLYWaterWave效果展示](http://7xt4xp.com2.z0.glb.clouddn.com/github_CFWaterWave_show_01.gif)

![ZLYWaterWave效果展示](http://7xt4xp.com2.z0.glb.clouddn.com/github_CFWaterWave_show_02.gif)

# 反馈

如果有什么修改建议，可以发送邮件到coderfish@163.com，也欢迎到[我的博客](http://zhoulingyu.com)一起讨论学习哟~

----

2016年11月7日更新

由于 CF 前缀有 `Core Foundation` 歧义，更改为 ZLY。


