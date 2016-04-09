class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :called_911, default: false
      t.string :description
      t.string :ip_address, default: ''

      t.boolean :blocked, default: false
      t.integer :block_votes, default: 0
      # t.string :flag_ip_1, default: ''
      # t.string :flag_ip_2, default: ''
      # t.string :flag_ip_3, default: ''

      t.references :category

      t.timestamps null: false
    end
  end
end
