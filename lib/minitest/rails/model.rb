require "minitest/rails/spec"

module MiniTest
  module Rails
    class Model < Spec
      subject do
        self.class.name.split("::").first.constantize.new
      end
    end
  end
end

MiniTest::Spec.register_spec_type MiniTest::Rails::Model do |desc|
  desc.respond_to?(:ancestors) && !(desc.ancestors.map(&:to_s) & ["ActiveRecord::Base", "Mongoid::Document", "MongoMapper::Document", "DataMapper::Resource"]).empty?
end

