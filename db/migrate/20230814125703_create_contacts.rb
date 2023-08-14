class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
      t.boolean :is_cheacke, default: false
      
      t.timestamps
    end
  end
end
