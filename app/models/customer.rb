class Customer < ActiveRecord::Base
  has_many :accounts, dependent: :destroy
  has_many :contacts

  validates :name, presence: true

  def list_account_names()
    self.accounts.map {|account| account.name}
    #Account.where(:customer_id => self.id).map {|account| account.name}
  end

  def list_account_numbers()
    self.accounts.map {|account| account.account_number}
    #Account.where(:customer_id => self.id).map {|account| account.account_number}
  end

  # def list_customer_accounts()
  #   Account.where(:customer_id => self.id)
  # end
end
