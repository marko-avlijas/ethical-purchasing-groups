# == Schema Information
#
# Table name: legacy_order_items
#
#  id                      :integer          not null, primary key
#  order_id                :integer          not null
#  offer_item_id           :integer          not null
#  qty                     :decimal(7, 1)    not null
#  min_qty                 :decimal(7, 1)
#  solidary_qty            :decimal(7, 1)
#  solidary_qty_changed_at :datetime
#  status                  :string
#  status_changed_at       :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_legacy_order_items_on_offer_item_id  (offer_item_id)
#  index_legacy_order_items_on_order_id       (order_id)
#

class LegacyOrderItem < ApplicationRecord
  belongs_to :legacy_order
end

