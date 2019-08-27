require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "contentが空の場合、バリデーションは通らない" do
    comment = FactoryBot.build(:comment, :skip_validate, content: nil)
    expect(comment).not_to be_valid
  end

  it "contentが文字数1001以上の場合、バリデーションは通らない" do
    comment = FactoryBot.build(:comment, :skip_validate, content: "a" * 1001)
    expect(comment).not_to be_valid
  end
end
