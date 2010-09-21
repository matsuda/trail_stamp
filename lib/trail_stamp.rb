require 'monitor/trail'
require 'monitor/stamp'

module TrailStamp
  autoload :Controller, 'trail_stamp/controller'
  autoload :ActsAsStamper, 'trail_stamp/acts_as_stamper'
  # autoload :Filter, 'trail_stamp/filter'
end

ActionController::Base.send :include, TrailStamp::Controller
ActiveRecord::Base.send :include, TrailStamp::ActsAsStamper
