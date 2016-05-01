class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :called_911, default: false
      t.string :description

      t.boolean :blocked, default: false

      t.references :category
      t.references :user

      t.timestamps null: false
    end
  end
end
