class AddFoundDateToStartup < ActiveRecord::Migration
  def change
    add_column :startups, :foundation_date, :string
    remove_column :startups, :found_year
    change_column :startups, :logo_url, :text
  end
end
