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

      t.references :category

      t.timestamps null: false
    end
  end
end
