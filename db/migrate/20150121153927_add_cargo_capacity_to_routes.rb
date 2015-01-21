class AddCargoCapacityToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :cargo_capacity, :integer
  end
end
