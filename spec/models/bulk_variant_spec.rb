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

RSpec.describe BulkVariant, type: :model do
  subject { build_stubbed(:bulk_variant) }

  describe "validations" do
    it_behaves_like "product variant"
  end
end
