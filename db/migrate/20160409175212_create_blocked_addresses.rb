class CreateBlockedAddresses < ActiveRecord::Migration
  def change
    create_table :blocked_addresses do |t|
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
