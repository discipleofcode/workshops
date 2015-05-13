class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :t.boolean, :string
    add_column :users, :, :admin,
    add_column :users, :, :default
    add_column :users, :=, :string
  end
end
