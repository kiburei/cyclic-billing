class AddStuffToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :bach_no, :string
    add_column :accounts, :Date, :date
  end
end
