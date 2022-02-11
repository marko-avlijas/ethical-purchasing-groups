FactoryBot.define do
  factory :package_variant, parent: :product_variant, class: PackageVariant do
    type { "PackageVariant" }
  end
end

