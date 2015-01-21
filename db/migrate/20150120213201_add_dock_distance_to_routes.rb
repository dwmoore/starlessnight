class AddDockDistanceToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :dock_distance, :decimal
  end
end
