FactoryBot.define do
  factory :group do
    sequence(:title) { |n| "Group #{n}" }
    city_id { 1 }

    trait(:in_zagreb) do
      city_id { 1 }
    end
    trait(:in_split) do
      city_id { 2 }
    end
    trait(:in_rome) do
      city_id { 3 }
    end
    trait(:in_milan) do
      city_id { 4 }
    end
    trait(:in_new_york_city) do
      city_id { 5 }
    end
    trait(:in_los_angeles) do
      city_id { 6 }
    end

    trait(:croatian) do
      city_id { 1 }
    end
    trait(:italian) do
      city_id { 3 }
    end
    trait(:usa) do
      city_id { 5 }
    end
  end
end
