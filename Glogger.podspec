Pod::Spec.new do |s|

  s.name         = 'Glogger'
  s.version      = '0.2.1'
  s.summary      = 'Simple Logger.'

  s.description  = <<-DESC
  Simple Logger. What give you to add an additional loggers.
                   DESC

  s.homepage     = 'https://github.com/gorillka/Glogger'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { 'Artem Orynko' => 'a.orynko@gmail.com' }
 
  s.platform = :ios, '10.0'
  # s.platform = :osx, '10.12'
  s.platform = :tvos, '10.0'
  s.platform = :watchos, '3.0'
  
  s.ios.deployment_target = '10.0'
  # s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'
  
  s.source       = { :git => 'https://github.com/gorillka/Glogger.git', :tag => s.version.to_s }
  s.source_files  = '*.h', '**/*.swift'
  
end
