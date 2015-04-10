class AddCustomerColumnToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :customer_id, :integer
  end
end
