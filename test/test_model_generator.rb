require "minitest/autorun"
require "minitest-rails"
require 'generators/minitest/model/model_generator'

class TestModelGenerator < MiniTest::Unit::TestCase
  def test_model_generator
    text = capture(:stdout) do
      MiniTest::Generators::ModelGenerator.start ['model']
    end
    assert_equal "awesome job!", text
  end
end
