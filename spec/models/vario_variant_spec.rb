# == Schema Information
#
# Table name: product_variants
#
#  id                     :integer          not null, primary key
#  product_id             :integer          not null
#  additional_note        :text
#  order                  :integer
#  active                 :boolean          default("true"), not null
#  type                   :string           not null
#  unit                   :string           not null
#  price                  :decimal(10, 2)   not null
#  min_quantity_per_order :decimal(7, 2)
#  min_weight             :decimal(, )
#  max_weight             :decimal(, )
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_product_variants_on_product_id  (product_id)
#

require 'rails_helper'
require 'support/shared_examples_for_product_variant'

RSpec.describe VarioVariant, type: :model do
  subject { build_stubbed(:vario_variant) }

  describe "validations" do
    it_behaves_like "product variant"

    it "min_weight must be present" do
      subject.min_weight = nil
      expect(subject).not_to be_valid
      expect(subject.errors.added? :min_weight, :not_a_number, value: nil).to be true
    end

    it "min_weight can't be negative" do
      subject.min_weight = -1 
      expect(subject).not_to be_valid
      expect(subject.errors.added? :min_weight, :greater_than, value: -1, count: 0).to be true
    end

    it "min_weight must be greater than 0" do
      subject.min_weight = 0
      expect(subject).not_to be_valid
      expect(subject.errors.added? :min_weight, :greater_than, value: 0, count: 0).to be true
    end

    it "max_weight must be present" do
      subject.max_weight = nil
      expect(subject).not_to be_valid
      expect(subject.errors.added? :max_weight, :not_a_number, value: nil).to be true
    end

    it "max_weight can't be negative" do
      subject.max_weight = -1 
      expect(subject).not_to be_valid
      expect(subject.errors.added? :max_weight, :greater_than, value: -1, count: 0).to be true
    end

    it "max_weight must be greater than 0" do
      subject.max_weight = 0
      expect(subject).not_to be_valid
      expect(subject.errors.added? :max_weight, :greater_than, value: 0, count: 0).to be true
    end

    it "max_weight must be greater than min_weight" do
      subject.min_weight = 2
      subject.max_weight = 1
      expect(subject).not_to be_valid
      expect(subject.errors.added? :max_weight, :greater_than, value: 1, count: 2).to be true
    end
  end
end
