require "helper"

module PeopleHelper
  def title(text)
    content_tag(:h1, text)
  end

  def homepage_path
    people_path
  end

  def homepage_url
    people_url
  end

  def link_to_person(person)
    link_to person.name, person
  end
end

# From Rails...
class CrazyHelperTest < ActionView::TestCase
  tests PeopleHelper

  def test_helper_class_can_be_set_manually_not_just_inferred
    assert_equal PeopleHelper, self.class.helper_class
  end
end

class CrazySymbolHelperTest < ActionView::TestCase
  tests :people

  def test_set_helper_class_using_symbol
    assert_equal PeopleHelper, self.class.helper_class
  end
end if Rails::VERSION::STRING >= "3.2"

class CrazyStringHelperTest < ActionView::TestCase
  tests 'people'

  def test_set_helper_class_using_string
    assert_equal PeopleHelper, self.class.helper_class
  end
end if Rails::VERSION::STRING >= "3.2"

# New tests...
describe PeopleHelper do
  it "resolves the right helper_class" do
    assert_equal PeopleHelper, self.class.helper_class
  end
end

describe PeopleHelper, :helper_class do
  it "resolves the right helper_class" do
    assert_equal PeopleHelper, self.class.helper_class
  end
end

describe PeopleHelper do
  describe "even while nested" do
    it "resolves the right helper_class" do
      assert_equal PeopleHelper, self.class.helper_class
    end
  end
end

describe PeopleHelper, :helper_class do
  describe "even while nested" do
    it "resolves the right helper_class" do
      assert_equal PeopleHelper, self.class.helper_class
    end
  end
end
