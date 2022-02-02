# == Schema Information
#
# Table name: legacy_offers
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  title           :string           not null
#  note            :text
#  valid_from      :datetime
#  valid_until     :datetime
#  company_name    :string
#  company_address :string
#  company_oib     :string
#  dispatch_place  :string
#  dispatch_date   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_legacy_offers_on_user_id  (user_id)
#

class LegacyOffer < ApplicationRecord
  belongs_to :user
  has_many :legacy_offer_items

  scope :by_title, ->(title) { where("legacy_offers.title ILIKE ?", "%#{title}%") if title.present? }
  scope :for_user, ->(user) { where(user: user) if user.present? }
end

