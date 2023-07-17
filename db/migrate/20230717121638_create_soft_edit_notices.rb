class CreateSoftEditNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :soft_edit_notices do |t|

      t.timestamps
    end
  end
end
