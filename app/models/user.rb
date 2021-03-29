class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :name, presence: true


  has_many :external_transactions, -> { where('is_group = ?', false) }, class_name: :Transaction
  has_many :groups, class_name: :Group, dependent: :destroy
  has_many :transactions, class_name: :Transaction, dependent: :destroy
  has_one_attached :avatar
end
