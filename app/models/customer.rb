class Customer < ActiveRecord::Base
  has_many :accounts
  has_many :contacts

  validates :name, presence: true

  def list_account_names()
    Account.where(:customer_name => self.name).map {|account| account.name}
  end

  def list_account_numbers()
    Account.where(:customer_name => self.name).map {|account| account.account_number}
  end
end
