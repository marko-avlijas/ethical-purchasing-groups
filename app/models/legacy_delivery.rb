# == Schema Information
#
# Table name: legacy_deliveries
#
#  id                 :integer          not null, primary key
#  legacy_offer_id    :integer          not null
#  legacy_location_id :integer
#  when               :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_legacy_deliveries_on_legacy_location_id  (legacy_location_id)
#  index_legacy_deliveries_on_legacy_offer_id     (legacy_offer_id)
#

class LegacyDelivery < ApplicationRecord
  belongs_to :legacy_location
  belongs_to :legacy_offer
end

