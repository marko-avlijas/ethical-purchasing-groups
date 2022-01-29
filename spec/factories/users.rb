# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :string
#  locked_at              :datetime
#  superadmin             :boolean          default("false"), not null
#  group_id               :integer
#  requested_group_id     :integer
#  name                   :string           not null
#  phone                  :string           not null
#  neighborhood           :string
#  is_producer            :boolean          default("false"), not null
#  about_text             :text
#  about_url              :string
#  locale                 :string           default("hr"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_group_id              (group_id)
#  index_users_on_requested_group_id    (requested_group_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    phone { Faker::PhoneNumber.unique.phone_number }
    password { '12345678' }
    password_confirmation { '12345678' }
    confirmed_at { Time.current }
    group_id { 1 }

    trait :unconfirmed do
      confirmed_at { nil }
    end

    trait :superadmin do
      superadmin { true }
    end
  end
end
