class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { buyer: "buyer", seller: "seller" }

  has_many :products, foreign_key: :seller_id, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

end

