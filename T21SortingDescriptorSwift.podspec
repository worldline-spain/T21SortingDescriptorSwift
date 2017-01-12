
Pod::Spec.new do |s|

  s.name         = "T21SortingDescriptorSwift"
  s.version      = "1.0.0"
  s.summary      = "T21SortingDescriptorSwift provides a helper type to use Sorting Descriptors in an easy way. Sorting Descriptors can also be combined to create different sorting levels."
  s.author    = "Eloi Guzman Ceron"
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/worldline-spain/T21SortingDescriptorSwift.git", :tag => "1.0.0" }
  s.source_files  = "Classes", "src/**/*.{swift}"
  s.framework  = "Foundation"
  s.requires_arc = true

end
