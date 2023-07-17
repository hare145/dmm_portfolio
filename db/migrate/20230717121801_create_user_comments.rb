class CreateUserComments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_comments do |t|
      t.integer  :user_id,        null: false
      t.integer  :profile_id,     null: false
      t.text     :content,        null: false
      t.boolean  :is_public,      default: false
      t.timestamps
    end
  end
end
