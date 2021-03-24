class Group < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_many :transactions, through: 'user', class_name: "Transaction"
    has_one_attached :icon, dependent: :destroy
end
