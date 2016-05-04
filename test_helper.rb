require 'minitest/reporters'

# monkey patch Minitest test order so we can work on problems
# in the order they appear

class MiniTest::Test

	# default to test_order = :defined for all tests
	def self.test_order
		:defined
	end

	# add handler for the case where test_order = :defined 
	def self.runnable_methods
		methods = methods_matching(/^test_/)

		case self.test_order
		when :random, :parallel then
			max = methods.size
			methods.sort.sort_by { rand max }
		when :defined then  # <-new
			methods
		when :alpha, :sorted then
			methods.sort
		else
			raise "Unknown test_order: #{self.test_order.inspect}"
		end
	end
end

module Minitest
	module Reporters
    class AwesomeReporter < DefaultReporter
      GREEN = '1;32'
      RED = '1;31'

      def color_up(string, color)
        color? ? "\e\[#{ color }m#{ string }#{ ANSI::Code::ENDCODE }" : string
      end

      def red(string)
        color_up(string, RED)
      end

      def green(string)
        color_up(string, GREEN)
      end
    end
  end
end

#reporter_options = { color: true, slow_count: 5 }
reporter_options = { color: true, detailed_skip: false }
Minitest::Reporters.use! [Minitest::Reporters::AwesomeReporter.new(reporter_options)]
