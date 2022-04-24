class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|


      t.string :name, null: false
      #t.integer :amount, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end
  end
end
