#
# Be sure to run `pod lib lint SwiftUUKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftUUKit'
  s.version          = '0.1.1'
  s.summary          = 'Common UI component tool classes, including TableView data-drive.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Common UI component tool classes, including TableView data-drive.
                       DESC

  s.homepage         = 'https://github.com/Xcoder1011/SwiftUUKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Xcoder1011' => 'shangkunwu@msn.com' }
  s.source           = { :git => 'https://github.com/Xcoder1011/SwiftUUKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

#  s.source_files = 'SwiftUUKit/Classes/**/*'
  
  s.subspec 'UUTableView' do |ss|
    ss.source_files = 'SwiftUUKit/Classes/UUTableView/**/*'
    ss.dependency 'SnapKit', '~> 5.0'
    ss.dependency 'SwiftUUKit/Utils'
  end
  
  s.subspec 'Utils' do |ss|
    ss.source_files = 'SwiftUUKit/Classes/Utils/**/*'
  end
  
  # s.resource_bundles = {
  #   'SwiftUUKit' => ['SwiftUUKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'SnapKit', '~> 5.0'
end
