class Group < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_many :transactions, class_name: "Transaction"
end
