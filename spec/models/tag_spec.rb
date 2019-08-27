require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "nameが空の場合、バリデーションは通らない" do
    tag = FactoryBot.build(:tag, :skip_validate, name: nil)
    expect(tag).not_to be_valid
  end

  it "nameが文字数16以上の場合、バリデーションは通らない" do
    tag = FactoryBot.build(:tag, :skip_validate, name: "a" * 16)
    expect(tag).not_to be_valid
  end

  it "nameが重複する場合、バリデーションは通らない" do
    tag = FactoryBot.create(:tag)
    tag2 = FactoryBot.build(:second_tag, :skip_validate, name: "test-tag")
    expect(tag2).not_to be_valid
  end
end
