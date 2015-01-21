class ChangeDistanceToJumpDistanceOnRoutes < ActiveRecord::Migration
  def change
    rename_column :routes, :distance, :jump_distance
  end
end
