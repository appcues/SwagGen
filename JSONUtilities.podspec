Pod::Spec.new do |s|
  s.name                    = 'JSONUtilities'
  s.version                 = '4.2.0'
  s.summary                 = 'JSONUtilities'
  s.platform                = :ios, '10.0'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage                = 'https://github.com/appcues/SwagGen'
  s.authors                 = { 'dodongo' => 'dgaxho@gmail.com' }
  s.source                  = { :git => 'https://github.com/appcues/SwagGen.git', :tag => "#{s.version}" }
  s.ios.vendored_frameworks = 'JSONUtilities.framework'
  s.module_name             = 'JSONUtilities'
  s.pod_target_xcconfig     = { 'DEFINES_MODULE' => 'YES' }
end
