require 'monitor/trail'
require 'monitor/stamp'

require File.join(File.dirname(__FILE__), 'trail_stamp', 'controller')
# require File.join(File.dirname(__FILE__), 'trail_stamp', 'filter')

module TrailStamp
  autoload :Controller, 'trail_stamp/controller'
  # autoload :Filter, 'trail_stamp/filter'
end
