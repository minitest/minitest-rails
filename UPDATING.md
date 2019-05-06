# Updating from previous versions

If you are upgrading from previous versions, then there are some subtle changes that you should be aware of. Do you see a change that is not listed in this document? Then please [open an issue](https://github.com/blowmage/minitest-rails/issues/new) to add it.

## Spec DSL

The `describe` block should be passed the actual constant and not a string of the constant's name. This works:

```ruby
describe WidgetsController do
```

But this does not:

```ruby
describe "WidgetsController" do
```

If you want to pass a string, then you must provide an additional description to tell the Spec DSL what test class to use:

```ruby
describe "WidgetsController", :controller do
```

## Expectations

The signature for the expectation `must_change` has changed from earlier versions of minitest-rails. This is because the expectation used to refer to the `assert_difference` assertion, but not refers to the `assert_changes` assertion added in Rails 5.1. The expectation for the `assert_difference` assertion is now `must_differ`.

## Versioning

The minitest-rails gem now follows Rails versioning. This means minitest-rails 6.0.x works for rails 6.0.x, and minitest-rails 6.1.x will work for rails 6.1.x.
