class Group < ApplicationRecord
    before_save :set_avatar

    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_many :transactions, through: 'user', class_name: "Transaction", foreign_key: "transaction_id"
    has_one_attached :icon, dependent: :destroy
   
    def set_avatar 
        if icon.blank?
            icon = "/app/assets/images/icon.png"
        end
    end
end
