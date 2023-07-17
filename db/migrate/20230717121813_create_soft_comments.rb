class CreateSoftComments < ActiveRecord::Migration[6.1]
  def change
    create_table :soft_comments do |t|
      t.integer  :user_id,        null: false
      t.integer  :facilitiy_id,   null: false
      t.text     :content,        null: false
      t.boolean  :is_public,      default: false
      t.timestamps
    end
  end
end
