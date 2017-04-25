source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
use_frameworks!

target 'PHTNNetwork' do
  pod 'AlamofireImage'
  pod 'AlamofireObjectMapper', '~> 4.0'
  pod 'RxSwift', '3.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end