class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :called_911
      t.string :description

      t.references :category

      t.timestamps null: false
    end
  end
end
