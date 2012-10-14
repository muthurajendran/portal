class CreatePlacementSearches < ActiveRecord::Migration
  def self.up
    create_table :placement_searches do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :placement_searches
  end
end
