source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
swift_version = '3.0'
use_frameworks!

def samplePods
    pod 'RealmSwift'
end

def sampleTestPods
    pod 'Quick'
    pod 'Nimble'
end


target 'QuickSample' do
  samplePods
end

target 'QuickSampleTests' do
  samplePods
  sampleTestPods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

