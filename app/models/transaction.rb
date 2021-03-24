class Transaction < ApplicationRecord
    belongs_to :user, class_name: "User"
    has_one :group, through: :user,  class_name: "Group", foreign_key: "group_id", source: :groups
end
