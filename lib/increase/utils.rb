# frozen_string_literal: true

require 'increase/utils/version'
require 'increase/utils/retry'

module Increase
  module Utils
    extend Increase::Utils::Retry
  end
end
