class Account < ActiveRecord::Base
  belongs_to :customer

  validates :account_number, presence: true
end
