class CreateTimelines < ActiveRecord::Migration[6.1]
  def change
    create_table :timelines do |t|
      t.integer :cook_id
      t.integer :follower_id
      t.integer :customer_id
      t.string :name

      t.timestamps
    end
  end
end
