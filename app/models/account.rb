class Account < ActiveRecord::Base
  belongs_to :customer

  validates :account_number, presence: true, length: { is: 5 }
  validates :name, presence: true
end
