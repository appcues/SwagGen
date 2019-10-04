Pod::Spec.new do |s|
  s.name                    = 'PathKit'
  s.version                 = '4.2.0'
  s.summary                 = 'PathKit'
  s.platform                = :ios, '10.0'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage                = 'https://github.com/appcues/SwagGen'
  s.authors                 = { 'dodongo' => 'dgaxho@gmail.com' }
  s.source                  = { :git => 'https://github.com/appcues/SwagGen.git', :tag => "#{s.version}" }
  s.ios.vendored_frameworks = 'PathKit.framework'
  s.module_name             = 'PathKit'
  s.pod_target_xcconfig     = { 'DEFINES_MODULE' => 'YES' }
end