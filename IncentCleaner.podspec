#
# Be sure to run `pod lib lint IncentCleaner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IncentCleaner'
  s.version          = '1.12'
  s.summary          = 'Framework for incent traffic cutting off.'
  s.description      = 'The framework that can help to cut off any actions of users that came from incent traffic.'
  s.homepage         = 'https://github.com/appbooster/incent-cleaner-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vladimir Vasilev' => 'fredformout@yandex.ru' }
  s.source           = { :git => 'https://github.com/appbooster/incent-cleaner-ios.git', :tag => s.version }
  s.ios.deployment_target = '9.0'
  s.ios.vendored_frameworks = 'IncentCleaner.xcframework'
  s.swift_version = "5.0"
end
