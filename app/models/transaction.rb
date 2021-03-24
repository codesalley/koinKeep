class Transaction < ApplicationRecord
    belongs_to :user, class_name: "User"
    #belongs_to :group, class_name: "Group", foreign_key: 'group_id'
    has_one :group, through: :user,  class_name: "Group", foreign_key: "group_id", source: :groups
end
