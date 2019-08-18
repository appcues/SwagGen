Pod::Spec.new do |s|
  s.name                    = 'CYaml'
  s.version                 = '4.2.0'
  s.summary                 = 'CYaml'
  s.platform                = :ios, '10.0'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage                = 'https://github.com/appcues/SwagGen'
  s.authors                 = { 'dodongo' => 'dgaxho@gmail.com' }
  s.source                  = { :git => 'https://github.com/appcues/SwagGen.git', :tag => "#{s.version}" }
  s.ios.vendored_frameworks = 'CYaml.framework'
  s.module_name             = 'CYaml'
  s.pod_target_xcconfig     = { 'DEFINES_MODULE' => 'YES' }
end
