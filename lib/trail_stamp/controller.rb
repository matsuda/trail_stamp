module TrailStamp
  module Controller
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def trail_stamp(stamper_method = 'current_user')
        include InstanceMethods
        around_filter :stamp_on
        class_eval <<-EOF
          private
          def stamper
            #{stamper_method}
          end
        EOF
      end
    end

    module InstanceMethods
      private
      def stamp_on
        @_monitor_trail = Monitor::Trail.new
        @_monitor_trail.controller = controller_path
        @_monitor_trail.action = action_name
        @_monitor_trail.stamper = stamper
        yield
        @_monitor_trail.save
      end

      def add_stamp(record)
        @_monitor_trail.add_stamp(record)
      end
    end
  end
end
