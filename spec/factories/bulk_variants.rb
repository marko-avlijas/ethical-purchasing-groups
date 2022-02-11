FactoryBot.define do
  factory :bulk_variant, parent: :product_variant, class: BulkVariant do
    type { "BulkVariant" }
  end
end

