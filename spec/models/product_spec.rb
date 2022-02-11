# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  note        :text
#  producer_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_producer_id            (producer_id)
#  index_products_on_producer_id_and_title  (producer_id,title) UNIQUE
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    let(:product) { build_stubbed(:product) }
    let(:producer) { create(:user, :producer) }
    let(:another_producer) { create(:user, :producer) }

    it "is valid" do
      expect(product).to be_valid
    end

    it "title must be present" do
      product.title = "  "
      expect(product).not_to be_valid
      expect(product.errors.added? :title, :blank).to be true
    end

    it "title must be unique per producer" do
      title = "Milk"
      create(:product, producer: another_producer, title: title)

      product = build(:product, title: title, producer: producer)
      expect(product).to be_valid

      product = build(:product, title: title, producer: another_producer)
      expect(product).not_to be_valid
      expect(product.errors.added? :title, :taken, value: title).to be true
    end
  end
end
