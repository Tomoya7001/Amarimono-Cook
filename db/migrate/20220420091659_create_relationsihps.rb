class CreateRelationsihps < ActiveRecord::Migration[6.1]
  def change
    create_table :relationsihps do |t|

    t.integer :follower_id, null: false
    t.integer :followed_id, null: false

      t.timestamps
    end
  end
end
