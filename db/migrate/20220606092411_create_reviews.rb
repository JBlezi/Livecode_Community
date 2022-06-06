class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :ticket, null: false, foreign_key: true
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
