class Monitor::Stamp < ActiveRecord::Base
  set_table_name :monitor_stamps

  belongs_to :trail, :class_name => 'Monitor::Trail'
  belongs_to :stampable, :polymorphic => true
end
