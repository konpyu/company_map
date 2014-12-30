class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string      :name,      null: false
      t.string      :address,   null: false
      t.text        :description
      t.integer     :like_count, default: 0
      t.string      :logo_url
      t.integer     :employee_count
      t.integer     :found_year
      t.float       :lat
      t.float       :lng
      t.string      :area
      t.string      :category

      t.timestamps null: false
    end
  end
end
