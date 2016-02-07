class RemoveLatLngIndexFromStartup < ActiveRecord::Migration
  def change
    remove_index :startups, :lat
    remove_index :startups, :lng
  end
end
