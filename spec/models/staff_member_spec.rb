require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  describe "#password=" do
    example "文字列>hashed_passwordで60" do
      member = StaffMember.new
      member.password = "Combee"
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.size).to eq(60)
    end

    example "nilを与えルト、hashed_passeordはnilになる" do
      member = StaffMember.new(hashed_password: "x")
      member.password = nil
      expect(member.hashed_password).to be nil
    end
  end
end
