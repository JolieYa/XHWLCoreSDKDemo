#
# Be sure to run `pod lib lint DefaultSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name = 'XHWLCoreSDKDemo'
s.version = '0.1.0'
#s.license = 'MIT'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'openDoor on iOS.'

s.homepage = 'https://github.com/JolieYa/XHWLCoreSDKDemo'
s.authors = { 'JolieYa' => '511979194@qq.com' }
s.source = { :git => 'https://github.com/JolieYa/XHWLCoreSDKDemo.git', :tag => s.version.to_s }
s.requires_arc = true
s.platform        = :ios, "8.0"
s.ios.deployment_target = '8.0'


#s.source_files  = 'Lib', 'Lib/**/*.{h,m}'
#, 'Lib/RemoteOpenDoor/*.{h, m}', 'Lib/RemoteOpenDoor/**/*.{h,m}'
#s.resources    = 'Lib/*.bundle'
#s.dependency 'WilddogVideoCall', '~> 2.4.2'
#s.dependency 'WilddogSync', '~> 2.3.13'

#表示pod库项目依赖自己的framework
s.xcconfig  =  {'ENABLE_BITCODE' => 'NO', 'OTHER_LDFLAGS' => '-ObjC'}
#s.resource_bundles = {
#'XHWLCoreSDK' => [ 'XHWLCoreSDK/Assets/*.png']
#}
#s.framework =  "XHWLCoreSDK"
#s.source_files = 'XHWLCoreSDKDemo/Lib'
s.vendored_frameworks = 'XHWLCoreSDK.framework'
s.dependency 'WilddogVideoCall', '~> 2.4.2'
s.dependency 'WilddogSync', '~> 2.3.13'


end
