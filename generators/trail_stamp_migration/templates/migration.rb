class TrailStampMigration < ActiveRecord::Migration
  def self.up
    create_table :monitor_trails do |t|
      t.integer       :stamper_id,        :comment => "操作者ID"
      t.string        :stamper_type,      :comment => "操作者モデル"
      t.string        :controller,        :comment => "コントローラー"
      t.string        :action,            :comment => "操作"
      t.timestamps
    end
    add_index :monitor_trails, [:stamper_id, :stamper_type]

    create_table :monitor_stamps do |t|
      t.integer       :trail_id,          :comment => "証跡ID"
      t.integer       :stampable_id,      :comment => "操作対象ID"
      t.string        :stampable_type,    :comment => "操作対象モデル"
      t.timestamps
    end
    add_index :monitor_stamps, :trail_id
    add_index :monitor_stamps, [:stampable_id, :stampable_type]
  end

  def self.down
    drop_table :monitor_trails
    drop_table :monitor_stamps
  end
end
