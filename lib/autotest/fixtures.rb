module Autotest::Fixtures
  Autotest.add_hook :initialize do  |at|
    at.test_mappings['^test/fixtures/(.*)s.yml'] = proc { |filename, matches|
      at.files_matching(/test\/\w+\/#{matches[1]}(_\w+)?.*_test.rb$/)
    }
  end
end
