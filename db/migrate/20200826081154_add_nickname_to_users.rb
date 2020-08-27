class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :gender_id, :integer, null: false
  end
end
