class AddUserNamesToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name, default: '', null: false
      t.string :last_name, default: '', null: false
      t.string :username, null: false
    end

    add_index  :users, :username, unique: true
  end
end
