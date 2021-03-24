class Transaction < ApplicationRecord
    belongs_to :user, class_name: "User"
    has_many :groups, class_name: "Group"
end
