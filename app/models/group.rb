# == Schema Information
#
# Table name: groups
#
#  id                :integer          not null, primary key
#  title             :string           not null
#  short_description :string
#  city_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_groups_on_city_id            (city_id)
#  index_groups_on_title_and_city_id  (title,city_id) UNIQUE
#

class Group < ApplicationRecord
  belongs_to :city

  validates :title, presence: true, uniqueness: { scope: :city }
  validates :short_description, length: { maximum: 255 }
end
