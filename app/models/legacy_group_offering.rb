# == Schema Information
#
# Table name: legacy_group_offerings
#
#  id              :integer          not null, primary key
#  legacy_offer_id :integer          not null
#  group_id        :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_legacy_group_offerings_on_group_id         (group_id)
#  index_legacy_group_offerings_on_legacy_offer_id  (legacy_offer_id)
#

class LegacyGroupOffering < ApplicationRecord
  belongs_to :group
  belongs_to :legacy_offer
end

