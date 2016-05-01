class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content, default: ''

      t.references :report
      t.references :user

      t.timestamps null: false
    end
  end
end
