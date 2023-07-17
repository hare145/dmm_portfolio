class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.text :contant,        null:false
      t.boolean :is_notice,    default: false
      t.timestamps
    end
  end
end
