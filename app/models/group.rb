class Group < ApplicationRecord
  belongs_to :city

  validates :title, presence: true, uniqueness: { scope: :city }
  validates :short_description, length: { maximum: 255 }
end
