require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameが空の場合、バリデーションは通らない" do
    user = FactoryBot.build(:user, :skip_validate, name: nil)
    expect(user).not_to be_valid
  end

  it "nameが文字数31以上の場合、バリデーションは通らない" do
    user = FactoryBot.build(:user, :skip_validate, name: "a" * 31)
    expect(user).not_to be_valid
  end

  it "nameが重複する場合、バリデーションは通らない" do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.build(:second_user, :skip_validate, name: "test-user")
    expect(user2).not_to be_valid
  end
end
