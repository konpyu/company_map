class AddIndexToStartup < ActiveRecord::Migration
  def change
    add_index :startups, :like_count
  end
end
