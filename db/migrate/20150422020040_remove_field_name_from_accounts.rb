class RemoveFieldNameFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :customer_name, :string
  end
end
