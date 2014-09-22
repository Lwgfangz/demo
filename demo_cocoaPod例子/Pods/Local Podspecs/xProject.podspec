
Pod::Spec.new do |s|
  s.name             = "xProject"
  s.version          = "1.0.1"
  s.summary          = "所有的xCode工程都可以引用的公共项目"
  s.description      = <<-DESC
                       所有的xCode工程都可以引用的公共项目.
                       DESC
  s.homepage         = "https://github.com/Lwgfangz/xProject"
  s.license          = 'MIT'
  s.author           = { "Lwgfangz" => "lwgfangz@gmail.com" }
  s.source           = { :git => "https://github.com/Lwgfangz/xProject.git", :tag => s.version.to_s }

  s.platform     = :ios, '4.3'
  s.requires_arc = true

  s.source_files = 'xProject/*'
  s.dependency  'NSLogger', '1.2'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

end
