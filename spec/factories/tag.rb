FactoryBot.define do
  factory :tag do
    name  {"test-tag"}
    trait :skip_validate do
      to_create { |tag| tag.save(validate: false) }
    end
  end

  factory :second_tag, class: Tag do
    name  {"second-tag"}
    trait :skip_validate do
      to_create { |tag| tag.save(validate: false) }
    end
  end
end
