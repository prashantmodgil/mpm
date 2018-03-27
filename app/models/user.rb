class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :accounts
  # accepts_nested_attributes_for :accounts
  attr_accessor :account_name
  after_create :account_create

  private
  def account_create
    self.accounts.create!(name: self.account_name)
  end
end
