# == Schema Information
#
# Table name: countries
#
#  id                :integer          not null, primary key
#  local_name        :string           not null
#  english_name      :string           not null
#  available_locales :string           not null, is an Array
#  alpha_2_code      :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_countries_on_english_name  (english_name) UNIQUE
#  index_countries_on_local_name    (local_name) UNIQUE
#

class Country < ApplicationRecord
  has_many :cities
end
