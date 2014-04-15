require "helper"

class InstallGenerator < Rails::Generators::Base; end

class TestGeneratorsSpecType < Minitest::Test
  def assert_generator actual
    assert_equal Rails::Generators::TestCase, actual
  end

  def refute_generator actual
    refute_equal Rails::Generators::TestCase, actual
  end

  def test_spec_type_resolves_for_class_constants
    assert_generator Minitest::Spec.spec_type(InstallGenerator)
  end

  def test_spec_type_resolves_for_matching_strings
    assert_generator Minitest::Spec.spec_type("InstallGenerator")
    assert_generator Minitest::Spec.spec_type("InstallGeneratorTest")
    assert_generator Minitest::Spec.spec_type("Install Generator Test")
    # And is not case sensitive
    assert_generator Minitest::Spec.spec_type("installgenerator")
    assert_generator Minitest::Spec.spec_type("installgeneratortest")
    assert_generator Minitest::Spec.spec_type("install generator test")
  end

  def test_spec_type_wont_match_non_space_characters
    refute_generator Minitest::Spec.spec_type("Install Generator\tTest")
    refute_generator Minitest::Spec.spec_type("Install Generator\rTest")
    refute_generator Minitest::Spec.spec_type("Install Generator\nTest")
    refute_generator Minitest::Spec.spec_type("Install Generator\fTest")
    refute_generator Minitest::Spec.spec_type("Install GeneratorXTest")
  end
end
