class CreateSoftEditNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :soft_edit_notices do |t|
      t.string  :user_id,        null: false
      t.string  :soft_info_id,   null: false
      t.boolean :is_notice,      default: false
      t.timestamps
    end
  end
end
