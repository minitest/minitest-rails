module Autotest::Migrate
  Autotest.add_hook(:run) do |autotest|
    system "rake db:migrate" if autotest.class.to_s == "MinitestRails"
  end
end
