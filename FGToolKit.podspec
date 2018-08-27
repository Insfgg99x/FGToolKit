Pod::Spec.new do |s|
s.name         = "FGToolKit"
s.version      = "2.1"
s.summary      = "FGToolKit is a Swift convenice tool kit"
s.homepage     = "https://github.com/Insfgg99x/FGToolKit"
s.license      = "MIT"
s.authors      = { "CGPointZero" => "newbox0512@yahoo.com" }
s.source       = { :git => "https://github.com/Insfgg99x/FGToolKit.git", :tag => "2.1"}
s.frameworks   = 'Foundation','UIKit'
s.ios.deployment_target = '8.0'
s.source_files = 'lib/*.swift'
s.requires_arc = true
s.dependency   'SnapKit'

end

