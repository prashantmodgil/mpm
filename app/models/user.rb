class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :account_create
  attr_accessor :name

  private
  def account_create
  Account.create(name: name, user_id: self.id)
  end
end
