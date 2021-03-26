class Group < ApplicationRecord
  validates_presence_of :name, presence: true, uniqueness: true
  validates_uniqueness_of :name

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :transactions, class_name: 'Transaction', foreign_key: 'group_id', dependent: :destroy
  has_one_attached :icon, dependent: :destroy
end
