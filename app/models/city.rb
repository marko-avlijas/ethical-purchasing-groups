# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  country_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cities_on_country_id           (country_id)
#  index_cities_on_name_and_country_id  (name,country_id) UNIQUE
#

class City < ApplicationRecord
  belongs_to :country
end
