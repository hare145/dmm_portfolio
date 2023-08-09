class CreateUsercomments < ActiveRecord::Migration[6.1]
  def change
    create_table :usercomments do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :page_id, null: false
      t.string :name, null: false
      t.text :content, null: false
      t.boolean :is_public, default: false
      
      t.timestamps
    end
  end
end
