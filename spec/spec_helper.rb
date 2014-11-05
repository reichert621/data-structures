require_relative '../queue/queue.rb'
require_relative '../stack/stack.rb'
require_relative '../linked-list/linked-list.rb'
require_relative '../hash-table/hash-table.rb'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end