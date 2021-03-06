class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :cook, null: false, foreign_key: true
      t.string :content
      t.string :score

      t.timestamps
    end
  end
end
