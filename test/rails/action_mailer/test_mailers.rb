require "helper"

class TestTestMailer < ActionMailer::Base; end

# From Rails...
class CrazyNameMailerTest < ActionMailer::TestCase
  tests TestTestMailer

  def test_set_mailer_class_manual
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

class CrazySymbolNameMailerTest < ActionMailer::TestCase
  tests :test_test_mailer

  def test_set_mailer_class_manual_using_symbol
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

class CrazyStringNameMailerTest < ActionMailer::TestCase
  tests 'test_test_mailer'

  def test_set_mailer_class_manual_using_string
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

# New tests...
describe TestTestMailer do
  it "gets the mailer from the test name" do
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

describe TestTestMailer, :action do
  it "gets the mailer from the test name" do
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

describe TestTestMailer do
  describe "nested" do
    it "gets the mailer from the test name" do
      assert_equal TestTestMailer, self.class.mailer_class
    end
  end
end

describe TestTestMailer, :action do
  describe "nested" do
    it "gets the mailer from the test name" do
      assert_equal TestTestMailer, self.class.mailer_class
    end
  end
end

describe "TestTestMailer", :mailer do
  it "gets the mailer from the test name" do
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

describe "TestTestMailer", :mailer do
  it "gets the mailer from the test name" do
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

describe "AnotherCrazySymbolNameMailer", :mailer do
  tests :test_test_mailer

  it "gets the mailer after setting it with a symbol" do
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

describe "AnotherCrazyStringNameMailer", :mailer do
  tests 'test_test_mailer'

  it "gets the mailer after setting it with a string" do
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

describe "Another Crazy Name", :mailer do
  tests TestTestMailer

  it "gets the mailer after setting it manually" do
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

describe "Another Crazy Symbol Name", :mailer do
  tests :test_test_mailer

  it "gets the mailer after setting it with a symbol" do
    assert_equal TestTestMailer, self.class.mailer_class
  end
end

describe "Another Crazy String Name", :mailer do
  tests 'test_test_mailer'

  it "gets the mailer after setting it with a string" do
    assert_equal TestTestMailer, self.class.mailer_class
  end
end
