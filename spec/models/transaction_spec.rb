require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'Transaction Associations' do
    it { should have_one(:group).through(:user).source :groups }
    it { should belong_to(:user).class_name(:User) }
  end
  describe 'Transaction Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end
end
