#
# Be sure to run `pod lib lint SASBanner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SASBanner'
  s.version          = '1.0.0'
  s.summary          = 'SASBanner - framework to create instant bannerView.'

  s.description      = <<-DESC
'Simple basic Horizontal Scrollable Banner View For Apps Development'
                       DESC

  s.homepage         = 'https://github.com/AnupSukumaran/SASBanner'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AnupSukumaran' => 'anup.sukumaran9@gmail.com' }
  s.source           = { :git => 'https://github.com/AnupSukumaran/SASBanner.git', :tag => s.version.to_s }
  

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/**/*'
  s.swift_version = '5.0'
  
end
