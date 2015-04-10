class AddCustomerNameColumnToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :customer_name, :string
  end
end
