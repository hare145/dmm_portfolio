class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :kind, null: false
      t.timestamps
    end
  end
end
