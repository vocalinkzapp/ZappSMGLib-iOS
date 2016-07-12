Pod::Spec.new do |s|

s.name         = "ZappSMGLibObjC"
s.version      = "1.0.0"
s.summary      = "Zapp Small Merchant Library"

s.description  = <<-DESC
Zapp Small Merchant Library
DESC


s.source       = { :git => 'https://github.com/vocalinkzapp/ZappSMGLib-iOS', :tag => s.version.to_s }
s.homepage     = "http://zapp.co.uk"
s.license      = "Apache License, Version 2.0"

s.author       = { "Alex Maimescu" => "alexandru.maimescu@vocalink.com" }

s.platform     = :ios, "7.0"

s.source_files  = "ZappSMGLib/ZappSMGLibObjC/**/*.{h,m}"
s.exclude_files = "Classes/Exclude"

s.ios.resource_bundle = { 'ZappSMGLibResources' => "ZappSMGLib/ZappSMGLibResources/**/*.png" }

end
