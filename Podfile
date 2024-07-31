# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

workspace 'SwiftDevLab.xcworkspace'

target 'Data' do
  project './Data/Data.project'
  use_frameworks!
end

target 'Domain' do
  project './Domain/Domain.project'
  use_frameworks!
end

target 'Presentation' do
  project './Presentation/Presentation.project'
  use_frameworks!
end

target 'SwiftDevLab' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SwiftDevLab
  
  target 'SwiftDevLabTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SwiftDevLabUITests' do
    # Pods for testing
  end

end
