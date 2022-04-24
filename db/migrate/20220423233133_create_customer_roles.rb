class CreateCustomerRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_roles do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :role, foreign_key: true, null: false

      t.timestamps
      t.index [:customer_id, :role_id], unique: true
    end
  end
end
