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

class Product < ApplicationRecord
  belongs_to :producer, class_name: "User"
  has_many :product_variants

  validates :title, presence: true, uniqueness: { scope: :producer_id }

  accepts_nested_attributes_for :product_variants, reject_if: :all_blank
  validates_associated :product_variants
end
