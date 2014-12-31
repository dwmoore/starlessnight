class AddReferenceRoutesToUsers < ActiveRecord::Migration
  def change
    add_reference :routes, :user, index: true
  end
end
