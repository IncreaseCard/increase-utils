# frozen_string_literal: true

module Increase
  module Utils
    module Retry
      def retry(times, error_klass = StandardError)
        tries = 0
        begin
          yield
        rescue error_klass => e
          tries += 1
          retry if tries <= times
          raise e
        end
      end
    end
  end
end
