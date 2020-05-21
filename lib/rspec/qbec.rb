# frozen_string_literal: true

require 'rspec'
require 'rspec/qbec/version'
require 'rspec/qbec/helper'

RSpec.configure do |config|
  config.include(RSpec::Qbec::Helpers)

  config.add_setting(:qbec_root, default: 'qbec')
end
