FactoryBot.define do
  factory :vario_variant, parent: :product_variant, class: VarioVariant do
    type { "VarioVariant" }
    min_weight { 0.5 }
    max_weight { 2.5 }
  end
end
