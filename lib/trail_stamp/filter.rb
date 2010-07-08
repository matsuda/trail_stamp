module TrailStamp
  class Filter
    def initialize
      @monitor_trail = Monitor::Trail.new
    end

    def before(controller)
      @monitor_trail.controller = controller.controller_path
      @monitor_trail.action = controller.action_name
      @monitor_trail.stamper = controller.stamper
    end

    def after(controller)
      @monitor_trail.save
    end
    
  end
end
