class CreateUserServices < ActiveRecord::Migration[6.1]
  def change
    create_table :user_services do |t|
      t.integer :use_id
      t.integer :service_id
      t.timestamps
    end
  end
end
