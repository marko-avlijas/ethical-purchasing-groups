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
#  name                   :string           not null
#  phone                  :string           not null
#  neighborhood           :string
#  about_text             :text
#  about_url              :string
#  locale                 :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_group_id              (group_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    let(:user) { build_stubbed(:user) }

    it "is valid" do
      aggregate_failures do
        expect(user.valid?).to be true
        expect(user.errors.full_messages).to eq([])
      end
    end

    it "email must be present" do
      user.email = "  "
      expect(user).not_to be_valid
      expect(user.errors.added? :email, :blank).to be true
    end

    it "name must be present" do
      user.name = "  "
      expect(user).not_to be_valid
      expect(user.errors.added? :name, :blank).to be true
    end

    it "phone must be present" do
      user.phone = "  "
      expect(user).not_to be_valid
      expect(user.errors.added? :phone, :blank).to be true
    end

    describe "password" do
      it "must be at least 8 characters long" do
        user.password = "1234567"
        user.password_confirmation = "1234567"
        expect(user.valid?).to be false
        expect(user.errors.added?(:password, :too_short, count: 8)).to be true
      end
    end
  end
end
