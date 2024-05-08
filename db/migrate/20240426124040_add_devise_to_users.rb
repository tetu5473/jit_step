class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def change
    # 既存の encrypted_password カラムを削除する
    remove_column :users, :encrypted_password if column_exists?(:users, :encrypted_password)

    # encrypted_password カラムを再生成する
    add_column :users, :encrypted_password, :string, null: false, default: ""

    ## Database authenticatable
    #add_column :users, :email, :string, null: false, default: ""

    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    # インデックスを追加
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    # メールアドレスのデフォルト値として空文字列を設定
    change_column_default :users, :email, from: nil, to: ""

  end
end
