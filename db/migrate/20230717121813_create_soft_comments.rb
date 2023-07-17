class CreateSoftComments < ActiveRecord::Migration[6.1]
  def change
    create_table :soft_comments do |t|

      t.timestamps
    end
  end
end
