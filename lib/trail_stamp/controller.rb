module TrailStamp
  module Controller
    def self.included(base)
      # base.extend(ClassMethods)
      base.send :include, InstanceMethods
    end

    module ClassMethods
    end

    module InstanceMethods
      private
      def stamper
        current_user
      end

      def stamp_on
        @monitor_trail = Monitor::Trail.new
        @monitor_trail.controller = controller_path
        @monitor_trail.action = action_name
        @monitor_trail.stamper = stamper
        yield
        @monitor_trail.save
      end

      def add_stamp(record)
        @monitor_trail.add_stamp(record)
      end
    end
  end
end
