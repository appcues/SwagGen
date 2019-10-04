Pod::Spec.new do |s|
  s.name                    = 'Swagger'
  s.version                 = '4.2.0'
  s.summary                 = 'SwagGen Swagger Parsing.'
  s.platform                = :ios, '10.0'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage                = 'https://github.com/appcues/SwagGen'
  s.authors                 = { 'dodongo' => 'dgaxho@gmail.com' }
  s.source                  = { :git => 'https://github.com/appcues/SwagGen.git', :tag => "#{s.version}" }
  s.module_name             = 'Swagger'
  s.source_files            = 'Sources/Swagger/**/*.{swift}'
  s.dependency              'JSONUtilities'
  s.dependency              'PathKit', '1.0.0'
  s.dependency              'Yams', '2.0.0'
end
