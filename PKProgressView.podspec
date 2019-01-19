#
#  Be sure to run `pod spec lint PKCountryPicker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "PKProgressView"
  s.version      = "0.1.0"
  s.summary      = "This framework will help you in implementing the progress view with animation."

  s.description  = <<-DESC
A Swift based helper class that will provide a progress view that can be used to fill it with animation, also can be used for car animation.
                   DESC

  s.homepage     = "https://github.com/bestiosdeveloper/PKProgressView"
  s.screenshots  = "https://github.com/bestiosdeveloper/PKProgressView/blob/master/PKProgressViewDemo/PKProgressView.gif"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "Pramod Kumar" => "kumarpramod017@gmail.com" }
  s.social_media_url   = "http://pramodkumar.cf/"

  s.ios.deployment_target = "11.0"

  s.source       = { :git => "https://github.com/bestiosdeveloper/PKProgressView.git", :tag => "#{s.version.to_s}" }
  s.source_files  = 'PKProgressViewDemo/PKProgressView/*'

end
