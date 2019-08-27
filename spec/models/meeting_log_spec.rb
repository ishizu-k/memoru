require 'rails_helper'

RSpec.describe MeetingLog, type: :model do
  it "nameが空の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, name: nil)
    expect(meeting_log).not_to be_valid
  end

  it "nameが文字数31以上の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, name: "a" * 31)
    expect(meeting_log).not_to be_valid
  end

  it "nameが重複する場合、バリデーションは通らない" do
    meeting_log = FactoryBot.create(:meeting_log)
    meeting_log2 = FactoryBot.build(:second_meeting_log, :skip_validate, name: "test-name")
    expect(meeting_log2).not_to be_valid
  end

  it "dayが空の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, day: nil)
    expect(meeting_log).not_to be_valid
  end

  it "placeが空の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, place: nil)
    expect(meeting_log).not_to be_valid
  end

  it "placeが文字数151以上の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, place: "a" * 151)
    expect(meeting_log).not_to be_valid
  end

  it "memoが空の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, memo: nil)
    expect(meeting_log).not_to be_valid
  end

  it "memoが文字数151以上の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, memo: "a" * 151)
    expect(meeting_log).not_to be_valid
  end

  it "howが空の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, how: nil)
    expect(meeting_log).not_to be_valid
  end

  it "howが文字数151以上の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, how: "a" * 151)
    expect(meeting_log).not_to be_valid
  end

  it "positionが空の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, position: nil)
    expect(meeting_log).not_to be_valid
  end

  it "positionが文字数151以上の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, position: "a" * 151)
    expect(meeting_log).not_to be_valid
  end

  it "statusが空の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, status: nil)
    expect(meeting_log).not_to be_valid
  end

  it "lookが文字数301以上の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, look: "a" * 301)
    expect(meeting_log).not_to be_valid
  end

  it "hometownが文字数101以上の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, hometown: "a" * 101)
    expect(meeting_log).not_to be_valid
  end

  it "otherが文字数501以上の場合、バリデーションは通らない" do
    meeting_log = FactoryBot.build(:meeting_log, :skip_validate, other: "a" * 501)
    expect(meeting_log).not_to be_valid
  end
end
