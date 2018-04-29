
Pod::Spec.new do |s|
  s.name         = "RNFilesViewIos"
  s.version      = "1.0.0"
  s.summary      = "RNFilesViewIos"
  s.description  = <<-DESC
                  RNFilesViewIos
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNFilesViewIos.git", :tag => "master" }
  s.source_files  = "RNFilesViewIos/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  