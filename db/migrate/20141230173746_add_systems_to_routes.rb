class AddSystemsToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :starting_system, :string
    add_column :routes, :ending_system, :string
    add_column :routes, :commodity, :string
    add_column :routes, :buy_price, :integer
    add_column :routes, :sell_price, :integer
    add_column :routes, :distance, :decimal

    add_index :routes, :starting_system
    add_index :routes, :ending_system
  end
end
