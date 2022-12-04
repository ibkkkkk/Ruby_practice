require "rails_helper"

describe Staff::Authenticator do
  describe "#authenticate" do
    
    example "if correct password? true" do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "inccorrect password? false" do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate("xy")).to be_falsey
    end

    example "if unsetted password? false" do
      m = build(:staff_member, password: nil)
      expect(Staff::Authenticator.new(m).authenticate(nil)).to be_falsey
    end

    example "if 停止フラグ? false" do
      m = build(:staff_member, suspended: true)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    example "if before start? false" do
      m = build(:staff_member, start_date: Date.tomorrow)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    example "if after end? false" do
      m = build(:staff_member, end_date: Date.today)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    end
  end
end
