class ChangeLatLngType < ActiveRecord::Migration
  def change
    change_column :startups, :lat, :decimal, :precision => 9, :scale => 6
    change_column :startups, :lng, :decimal, :precision => 9, :scale => 6
  end
end
