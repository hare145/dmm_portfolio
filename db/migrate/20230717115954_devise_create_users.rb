# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.string  :name,                    null: false
      t.integer :employee,                null: false
      t.integer :impressions_count,       default: 0
      t.string  :account_soft,            default: "会計使用ソフト"
      t.text    :account_reason
      t.string  :accounting_soft,         default: "経理使用ソフト"
      t.text    :accounting_reason
      t.string  :other_soft,              default: 'その他会計・経理使用ソフト'
      t.text    :other_reason
      t.string  :salary_soft,             default: "給料計算使用ソフト"
      t.text    :salary_reason
      t.string  :working_hours_soft,      default: "出退勤管理使用ソフト"
      t.text    :working_hours_reason
      t.string  :communication_soft,      default: "法人内コミュニケーションツール"
      t.text    :communication_reason
      t.string  :customer_info_soft,      default: "利用者情報管理ソフト"
      t.text    :customer_info_reason
      t.string  :customer_deposit_soft,   default: "利用者預り金管理ソフト"
      t.text    :customer_deposit_reason
      t.string  :customer_billing_soft,   default: "利用者請求ソフト"
      t.text    :customer_billing_reason
      t.boolean :is_deleted,              default: false
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

  end
end
