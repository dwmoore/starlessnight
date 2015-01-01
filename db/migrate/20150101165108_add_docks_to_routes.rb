class AddDocksToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :starting_dock, :string
    add_column :routes, :ending_dock, :string
  end
end
