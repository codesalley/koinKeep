class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :groups, class_name: :Group, dependent: :destroy
  has_many :transactions, class_name: :Transaction, dependent: :destroy
  has_one_attached :avatar


end
