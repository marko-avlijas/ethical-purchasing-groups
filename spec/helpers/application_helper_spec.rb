require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "#flash_class" do
    context "given correct flash level" do
      it "returns correct bootstrap class" do
        expect(helper.flash_class(:notice)).to eq('alert alert-info')
        expect(helper.flash_class(:success)).to eq('alert alert-success')
        expect(helper.flash_class(:alert)).to eq('alert alert-danger')
        expect(helper.flash_class(:warning)).to eq('alert alert-warning')
      end
    end

    context "given incorrect flash level" do
      it "raises ArgumentError " do
        expect { helper.flash_class(:woohoo) }.to raise_error(ArgumentError)
      end
    end
  end
end
