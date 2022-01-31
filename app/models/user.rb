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

class User < ApplicationRecord
  # Include devise modules. Others available are:
  # :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  before_validation :set_locale

  validates :name, :phone, presence: true

  attr_accessor :terms_of_service
  validates :terms_of_service, acceptance: true, on: :create
  
  belongs_to :group, optional: true
  belongs_to :requested_group, optional: true, class_name: "Group"

  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") if name.present? }
  scope :by_email, ->(email) { where("email ILIKE ?", "%#{email}%") if email.present? }

  # Admin filters
  scope :af_locked, ->(value) do
    return if value.blank?

    case value
    when "true"
      where("locked_at IS NOT NULL")
    when "false"
      where(locked_at: nil)
    end
  end

  scope :af_email_confirmed, ->(value) do
    return if value.blank?

    case value
    when "true"
      where("confirmed_at IS NOT NULL")
    when "false"
      where(confirmed_at: nil)
    end
  end

  scope :af_is_producer, ->(value) do
    return if value.blank?

    case value
    when "true"
      where(is_producer: true)
    when "false"
      where(is_producer: false)
    end
  end

  scope :af_admin, ->(value) do
    return if value.blank?

    case value
    when "true"
      where(superadmin: true)
    when "false"
      where(superadmin: false)
    end
  end

  protected

    def send_devise_notification(notification, *args)
      I18n.with_locale(locale) { super(notification, *args) }
    end

  private

    def set_locale
      self.locale = I18n.locale || I18n.default_locale
    end
end
