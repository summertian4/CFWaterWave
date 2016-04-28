# 简介
CFWaterWave是一个简单好用的iOS水波效果工具，可以让你的APP更加好看又去

# 原理简介
CFWaterWave的原理很简单，我们用Example里的工程做简介。

1. 首先准备两张图片，比如这样的：
![白色图片](http://7xt4xp.com2.z0.glb.clouddn.com/github_CFWaterWave_pic_white.png)
![红色图片](http://7xt4xp.com2.z0.glb.clouddn.com/github_CFWaterWave_pic_red.png)
2. 将两张图放在重叠的位置
3. 将其中一张图片加上波浪形的遮盖
![叠加添加遮盖效果](http://7xt4xp.com2.z0.glb.clouddn.com/github_CFWaterWave_img_03.png)
4. 如果波浪形的遮盖是动态再变化的的，就可以形成动态的波浪
5. CFWaterWave就是为你提供好了动态波浪的Path，你只需要在回调中加入遮盖即可
6. 如果你还是晕晕的，那就直接看Example吧，相信你瞬间就会明白的

# 安装
直接拽入`CFWaterWave.h`和`CFWaterWave.m`文件

# 使用
1. 创建CFWaterWave对象
```
- (CFWaterWave *)waterWave {
    if (_waterWave == nil) {
        // 给定的frame和你的图片frame一致即可
        _waterWave = [[CFWaterWave alloc] initWithFrame:self.pic_red.frame];
        _waterWave.delegate = self;
    }
    return _waterWave;
}
```
2. 实现好代理，在代理中给你想要实现水波纹的图片加上贝塞尔路径生成的遮盖
```
- (void)waterWave:(CFWaterWave *)waterWave wavePath:(UIBezierPath *)path {
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = path.CGPath;
    // 添加遮盖
    self.pic_red.layer.mask = maskLayer;
}
```

# 用例

# 反馈

如果有什么修改建议，可以发送邮件到coderfish@163.com，也欢迎到[我的博客](http://zhoulingyu.com)一起讨论学习哟~


