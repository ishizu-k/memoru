FactoryBot.define do
  factory :tag do
    name  {"test-tag"}
    association :user
    trait :skip_validate do
      to_create { |tag| tag.save(validate: false) }
    end
  end

  factory :second_tag, class: Tag do
    name  {"second-tag"}
    association :user, factory: :second_user
    trait :skip_validate do
      to_create { |tag| tag.save(validate: false) }
    end
  end
end
