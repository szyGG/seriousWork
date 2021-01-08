#
#  Be sure to run `pod spec lint seriousWork.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
Pod::Spec.new do |spec|



  spec.name         = "seriousWork"
  spec.version      = "0.0.3"
  spec.summary      = "组件."
  spec.description  = <<-DESC
   short description of A_section short description of A_section
                   DESC

  spec.homepage     = "https://github.com/szyGG/seriousWork.git"


  spec.license          = 'MIT'
 

  spec.author             = { 'szy' => '1538243267@qq.com' }
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = '9.0'
  #是否支持ARC
  spec.requires_arc = true

  spec.source       = { :git => "https://github.com/szyGG/seriousWork.git", :tag => "0.0.6" }



  spec.source_files  = "seriousWork/seriosWork/**/*.{h,m}"
  spec.resources = ['seriousWork/*.xcassets']

  spec.dependency "Masonry"

 

end
