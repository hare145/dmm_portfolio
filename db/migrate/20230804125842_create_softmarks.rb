class CreateSoftmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :softmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :soft, null: false, foreign_key: true

      t.timestamps
    end
  end
end
