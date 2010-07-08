class Monitor::Trail < ActiveRecord::Base
  set_table_name :monitor_trails

  has_many :stamps, :class_name => 'Monitor::Stamp', :dependent => :destroy
  belongs_to :stamper, :polymorphic => true

  before_validation :exist_stamps?

  def add_stamp(record)
    self.stamps << self.stamps.build(:stampable => record)
  end
  
  def exist_stamps?
    !self.stamps.blank?
  end
end
