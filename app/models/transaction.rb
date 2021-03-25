class Transaction < ApplicationRecord
    belongs_to :user, class_name: "User"
    has_one :group, class_name: "Group", foreign_key: "group_id"

    scope :most_recent, -> { sort_by(:created_at)}
    scope :external_transactions, -> {where("is_group = ?", true)}
end
