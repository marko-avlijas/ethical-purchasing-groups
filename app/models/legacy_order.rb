# == Schema Information
#
# Table name: legacy_orders
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  legacy_offer_id    :integer          not null
#  legacy_delivery_id :integer          not null
#  note               :text
#  status             :string
#  status_changed_at  :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_legacy_orders_on_legacy_delivery_id  (legacy_delivery_id)
#  index_legacy_orders_on_legacy_offer_id     (legacy_offer_id)
#  index_legacy_orders_on_user_id             (user_id)
#

class LegacyOrder < ApplicationRecord
  belongs_to :legacy_offer
  belongs_to :legacy_delivery
  has_many :legacy_order_items
end

