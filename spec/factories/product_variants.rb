# == Schema Information
#
# Table name: product_variants
#
#  id                     :integer          not null, primary key
#  product_id             :integer          not null
#  additional_note        :text
#  order                  :integer
#  active                 :boolean          default("true"), not null
#  type                   :string           not null
#  unit                   :string           not null
#  price                  :decimal(10, 2)   not null
#  min_quantity_per_order :decimal(7, 2)
#  min_weight             :decimal(, )
#  max_weight             :decimal(, )
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_product_variants_on_product_id  (product_id)
#

FactoryBot.define do
  factory :product_variant do
    unit { "kg" }
    price { 9.99 }
    
    product
  end
end
