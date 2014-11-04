require_relative '../queue/queue.rb'
require_relative '../stack/stack.rb'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end