class Transaction < ApplicationRecord
  validates_presence_of :name, presence: true
  validates_presence_of :amount, presence: true

  belongs_to :user, class_name: 'User'
  has_one :group, through: :user, class_name: 'Group', source: :groups, dependent: :destroy

  scope :most_recent, -> { sort_by(&:created_at).reverse }
  scope :external_transactions, -> { where('is_group = ?', false) }
end
