FactoryBot.define do
  factory :comment do
    content  {"test-content"}
    trait :skip_validate do
      to_create { |comment| comment.save(validate: false) }
    end
    association :meeting_log
  end
end
