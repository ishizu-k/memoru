FactoryBot.define do
  factory :meeting_log do
    name {"test-name"}
    day {"2019-08-01"}
    place {"test-place"}
    memo {"test-memo"}
    how {"test-how"}
    image {""}
    position {"test-position"}
    status {"memorizing"}
    age {"19"}
    look {"test-look"}
    birth {"2000-08-01"}
    blood {"unknown"}
    hometown {"test-hometown"}
    other {"test-other"}
    association :user
    trait :skip_validate do
      to_create { |meeting_log| meeting_log.save(validate: false) }
    end
  end

  factory :second_meeting_log, class: MeetingLog do
    name {"second-name"}
    day {"2019-08-01"}
    place {"test-place"}
    memo {"test-memo"}
    how {"test-how"}
    image {""}
    position {"test-position"}
    status {"memorizing"}
    age {"19"}
    look {"test-look"}
    birth {"2000-08-01"}
    blood {"unknown"}
    hometown {"test-hometown"}
    other {"test-other"}
    association :user, factory: :second_user
    trait :skip_validate do
      to_create { |meeting_log| meeting_log.save(validate: false) }
    end
  end
end
