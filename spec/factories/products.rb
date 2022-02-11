# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  note        :text
#  producer_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_producer_id            (producer_id)
#  index_products_on_producer_id_and_title  (producer_id,title) UNIQUE
#

FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Product #{n}" }
    association :producer, factory: :user
  end
end
