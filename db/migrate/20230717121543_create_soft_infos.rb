class CreateSoftInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :soft_infos do |t|

      t.timestamps
    end
  end
end
