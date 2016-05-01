class CreateBlockedPhoneNumbers < ActiveRecord::Migration
  def change
    create_table :blocked_phone_numbers do |t|
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
