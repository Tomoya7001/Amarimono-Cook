class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|
      #追加カラム
      t.integer :customer_id, null: false
      t.integer :genre_id, null: false
      t.string :cook_name, null: false
      t.text :introduction, null: false
      #t.datetime :created_at, null: false
      #t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
