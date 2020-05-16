#
#  Be sure to run `pod spec lint MyFramework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "TextFieldValidator"
  s.version      = "1.0"
  s.summary      = "Validate textField's text property to ensure some text exists, and present an alert if it doesn't in just a few lines."
  s.description  = <<-DESC
	Validate one or more textField's text property to ensure some text exists, and present an alert if it doesn't in just a few lines. Multiple textFields being passed in to the validator will be validated at once, and the message set for the textField will be separated by ",\n" by default. There is a closure which by default is set to an empty closure. The closure triggers when the alert is dismissed.
                   DESC
  s.homepage     = "https://github.com/froggomad/TextFieldValidator"
  s.license      = { :file => "LICENSE.txt", :type => "MIT" }
  s.author       = { "froggomad" => "kennydubroff.com" }
  s.source       = { :path => '.' }
  s.source       = { :git => "https://github.com/froggomad/TextFieldValidator.git", :tag => "#{s.version}" }
  s.source_files  = "TextFieldValidator/**/*.swift"
  s.swift_versions = "5"
  s.platforms = {:ios => 13.2}
end