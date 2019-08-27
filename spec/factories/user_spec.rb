FactoryBot.define do
  factory :user do
    name  {"test-user"}
    email  {"test@test.com"}
    password  {"111111"}
    password_confirmation  {"111111"}
    image  {""}
    trait :skip_validate do
      to_create { |user| user.save(validate: false) }
    end
  end

  factory :second_user, class: User do
    name  {"second-user"}
    email  {"second@test.com"}
    password  {"111111"}
    password_confirmation  {"111111"}
    image  {""}
    trait :skip_validate do
      to_create { |user| user.save(validate: false) }
    end
  end
end
