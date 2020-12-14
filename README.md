# minitest-rails

Minitest integration for Rails 6.1

[![Build Status](https://circleci.com/gh/blowmage/minitest-rails.svg?style=svg)](https://circleci.com/gh/blowmage/minitest-rails)
[![Code Climate](https://codeclimate.com/github/blowmage/minitest-rails.png)](https://codeclimate.com/github/blowmage/minitest-rails)

## Install

`gem install minitest-rails`

This installs the following gems:

* `minitest`

## Configure

Create a new rails app:

`rails new MyApp`

### Choosing a version

If you are running Rails 6.x, specify a corresponding 6.x release in the Gemfile. For example, if you are using Rails 6.1 you will specify:

```ruby
gem "minitest-rails", "~> 6.1.0"
```

If you are running Rails 5.x, specify a corresponding 5.x release in the Gemfile. For example, if you are using Rails 5.2 you will specify:

```ruby
gem "minitest-rails", "~> 5.2.0"
```

Or, if you prefer to run the previous release for Rails 5.x, specify a 3.x release in the Gemfile:

```ruby
gem "minitest-rails", "~> 3.0"
```

If you are running Rails 4.1 or 4.2, specify a 2.x release in the Gemfile:

```ruby
gem "minitest-rails", "~> 2.0"
```

If you are running Rails 4.0 or earlier, specify a 1.x release in the Gemfile:

```ruby
gem "minitest-rails", "~> 1.0"
```

### Installing

Next run the installation generator with the following:

`rails generate minitest:install`

This will add the `test_helper.rb` file to the `test` directory.

## Usage

This project aims to enable Minitest within the Rails TestCase classes.
Your test will continue to inherit from `ActiveSupport::TestCase`, which will now support the spec DSL.
You can generate test files using the `Minitest::Spec` DSL with the standard model, controller, resource, and other generators:

`rails generate model User`

And you can specify generating the tests without the `Minitest::Spec` DSL on any of the generators by providing the `--no-spec` option:

`rails generate model User --no-spec`

And you can specify not generating the fixture for a model by providing the `--skip-fixture` option:

`rails generate model User --skip-fixture`

You can also set these as defaults by adding the following to the `config/application.rb` file:

```ruby
config.generators do |g|
  g.test_framework :minitest, spec: false, fixture: false
end
```

## Running Tests

To run your tests use the `rails test` that ship with rails.

## Get Involved

Join the mailing list to get help or offer suggestions.

https://groups.google.com/group/minitest-rails

## License

Copyright (c) 2019 Mike Moore

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
