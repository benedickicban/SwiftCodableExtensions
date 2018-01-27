Pod::Spec.new do |s|

  s.name         = "CodeExtensions"
  s.version      = "0.1.0"
  s.summary      = "A summary of your framework"

  s.description  = <<-DESC
       A description about your framework
                   DESC

  s.homepage     = "https://github.com/davidthorn/CodeExtensions.git"

  s.license      = { :type => "Proprietary", :file => "CodeExtensions/CodeExtensions.bundle/LICENSE" }

  s.author       = { "David Thorn" => "david.thorn221278@googlemail.com" }

  s.ios.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/davidthorn/CodeExtensions.git", :tag => "#{s.version}" }

  s.source_files  = "CodeExtensions"

end
