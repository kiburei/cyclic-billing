class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :dep_acc
      t.string :amount
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
