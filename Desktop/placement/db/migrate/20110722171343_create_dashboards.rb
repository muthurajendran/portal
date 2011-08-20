class CreateDashboards < ActiveRecord::Migration
  def self.up
    create_table :dashboards do |t|
       t.string :dash_head
        t.string :board
      t.timestamps
    end
  end

  def self.down
    drop_table :dashboards
  end
end