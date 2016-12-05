#
#  Be sure to run `pod spec lint ZLYWaterWave.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "ZLYWaterWave"
  s.version      = "1.0.0"
  s.summary      = "A tool of water wave effect on iOS."
  s.homepage     = "https://github.com/summertian4/CFWaterWave"
  s.screenshots  = "https://camo.githubusercontent.com/0cde7d26dbe86d2091845245ad526ce81ca5826f/687474703a2f2f3778743478702e636f6d322e7a302e676c622e636c6f7564646e2e636f6d2f6769746875625f43465761746572576176655f73686f775f30312e676966"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license          = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author             = { "小鱼周凌宇" => "coderfish@163.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  #  When using multiple platforms
  s.ios.deployment_target = "7.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/summertian4/CFWaterWave.git", :tag => s.version.to_s }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "ZLYWaterWave/*.{h,m}"

end
