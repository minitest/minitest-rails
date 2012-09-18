Autotest.add_discovery do
  style = []
  style = ["minitest", "rails"] if File.exist? 'config/application.rb'
  style
end
