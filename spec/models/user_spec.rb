require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User associations' do
    it { should have_many(:groups).class_name(:Group).dependent :destroy }
    it { should have_many(:transactions).class_name(:Transaction).dependent :destroy }
  end
  describe 'User Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
