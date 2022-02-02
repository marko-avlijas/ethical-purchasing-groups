# == Schema Information
#
# Table name: legacy_locations
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  lat         :float
#  lng         :float
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_legacy_offers_on_title  (title) UNIQUE
#

class LegacyLocation < ApplicationRecord
end

