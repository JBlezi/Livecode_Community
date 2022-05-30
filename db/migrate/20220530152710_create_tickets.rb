class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :content
      t.string :language
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
