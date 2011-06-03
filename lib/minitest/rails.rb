require "minitest/rails/model"
require "minitest/rails/helper"
require "minitest/rails/controller"

# The order you register matters
MiniTest::Spec.register_spec_type(//,             MiniTest::Rails::ModelSpec)
MiniTest::Spec.register_spec_type(/Controller$/,  MiniTest::Rails::ControllerSpec)
MiniTest::Spec.register_spec_type(/Helper$/,      MiniTest::Rails::HelperSpec)
