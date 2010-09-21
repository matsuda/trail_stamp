module TrailStamp
  module ActsAsStamper
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def acts_as_stamper(stamper_method = 'name')
        has_many :trails, :class_name => 'Monitor::Trail', :as => :stamper

        class_eval <<-EOF
          def stamper_name
            #{stamper_method}
          end
        EOF
      end
    end
  end
end
