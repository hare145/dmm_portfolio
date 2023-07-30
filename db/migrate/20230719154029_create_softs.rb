class CreateSofts < ActiveRecord::Migration[6.1]
  def change
    create_table :softs do |t|
      t.integer :user_id,                 null: false
      t.integer :work_id,                 null: false
      t.integer :impressions_count,       default: 0
      t.string  :company,                 null: false
      t.string  :address,                 null: false
      t.string  :founding     
      t.string  :url,                     null: false
      t.text    :introduction,            null: false
      t.integer :first_cost
      t.integer :month_cost
      t.integer :year_cost
      t.text  :function
      t.boolean  :is_public,              default: false
      t.timestamps
    end
  end
end
