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
end
