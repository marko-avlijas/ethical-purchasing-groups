# == Schema Information
#
# Table name: legacy_offer_items
#
#  id                    :integer          not null, primary key
#  legacy_offer_id       :integer          not null
#  title                 :string           not null
#  position              :integer          default("0"), not null
#  note                  :text
#  placeholder           :boolean          default("false"), not null
#  status                :string
#  status_changed_at     :datetime
#  total_available_qty   :decimal(7, 1)
#  min_qty_per_order     :decimal(7, 1)
#  packaging             :string
#  packaging_description :string
#  unit_bulk             :string
#  price_bulk            :integer
#  unit_package          :string
#  price_package         :integer
#  unit_vario            :string
#  price_vario           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_legacy_offer_items_on_legacy_offer_id  (legacy_offer_id)
#

# NOTE:
# In legacy database:
# placeholder is always false
# total_available_qty is always null
# packaging_description is always null
# status is "deactivated" or null
# packaging is ["vario", "package", "bulk"]
# min_qty_per_order is [0.0, 0.1e0, 0.2e0, 0.3e0, 0.4e0, 0.5e0, 0.6e0, 0.8e0, 0.1e1, 0.15e1, 0.2e1, 0.3e1, 0.5e1, 0.6e1, 0.3e3, 0.5e3]

class LegacyOfferItem < ApplicationRecord
  belongs_to :legacy_offer

  scope :by_title, ->(title) { where("legacy_offer_items.title ILIKE ?", "%#{title}%") if title.present? }
  scope :for_user, ->(user) { joins(:legacy_offer).where(legacy_offer: { user: user }) if user.present? }
  scope :for_legacy_offer, ->(value) { where(legacy_offer: value) if value.present? }

  scope :similar_to, ->(another) do
    where("TRIM(LOWER(title))=TRIM(LOWER(?)) AND LOWER(packaging) = LOWER(?)", another.title, another.packaging)
      .where("LOWER(unit_package) = LOWER(?)", another.unit_package)
      .where("LOWER(unit_bulk) = LOWER(?)", another.unit_bulk)
      .where("LOWER(unit_vario) = LOWER(?)", another.unit_vario)
      .where("id != ?", another.id)
  end

  def similar?(another)
    return false unless another.is_a?(LegacyOfferItem)

    title.downcase.strip == another.title.downcase.strip &&
      packaging.downcase == another.packaging.downcase &&
      unit_package&.downcase == another.unit_package&.downcase &&
      unit_bulk&.downcase == another.unit_bulk&.downcase &&
      unit_vario&.downcase == another.unit_vario&.downcase
  end
end

