class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string      :name,      null: false
      t.string      :company_name,  null: false
      t.string      :address,   null: false
      t.string      :company_url
      t.text        :description
      t.integer     :like_count, default: 0
      t.string      :logo_url
      t.integer     :employee_count
      t.integer     :found_year
      t.integer     :job_count
      t.float       :lat
      t.float       :lng
      t.float       :vlat
      t.float       :vlng
      t.string      :area
      t.string      :category

      t.timestamps null: false
    end
    add_index :startups, :lat
    add_index :startups, :lng
    add_index :startups, :name, unique: true
  end
end
