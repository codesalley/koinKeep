require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "Group Associations " do 
    it {should have_many(:transactions).class_name(:Transaction).with_foreign_key(:group_id).dependent :destroy}
    it {should belong_to(:user).class_name(:User).with_foreign_key(:user_id)}
    it { should have_one_attached(:icon)}
  end
end
