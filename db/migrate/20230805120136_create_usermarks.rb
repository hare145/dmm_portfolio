class CreateUsermarks < ActiveRecord::Migration[6.1]
  def change
    create_table :usermarks do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :page_id, null: false

      t.timestamps
    end
  end
end
