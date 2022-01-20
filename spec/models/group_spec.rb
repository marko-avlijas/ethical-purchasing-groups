require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "#validations" do
    subject { build(:group) }

    it "valid group is valid" do
      expect(subject).to be_valid
    end

    it "title must be present" do
      subject.title = nil
      expect(subject).not_to be_valid
      expect(subject.errors.added? :title, :blank).to be true
    end

    it "short_description must be maximum 255 characters long" do
      subject.short_description = 'A' * 255
      expect(subject).to be_valid

      subject.short_description = 'A' * 256
      expect(subject).not_to be_valid
      expect(subject.errors.added? :short_description, :too_long, count: 255).to be true
    end

    it "title must be unique per each city" do
      title = "Best Group"
      create(:group, :in_rome, title: title)

      expect(build(:group, :in_milan, title: title)).to be_valid

      group = build(:group, :in_rome, title: title)
      expect(group).not_to be_valid
      expect(group.errors.added?(:title, :taken, value: title)).to be true
    end
  end
end
