class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|

    ##検索用カラム
    t.integer :customer_id, null: false
    t.integer :genre_id, null: false
    t.string :cook_name, null: false

      t.timestamps
    end
  end
end
