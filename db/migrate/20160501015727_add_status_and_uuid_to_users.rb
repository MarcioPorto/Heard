class AddStatusAndUuidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authy_status, :string
    add_column :users, :uuid, :string
  end
end
