# frozen_string_literal: true

module RSpec
  # Qbec module with version
  module Qbec
    VERSION = ::Gem::Version.new('0.0.3')

    def self.version
      VERSION
    end
  end
end
