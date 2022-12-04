require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe "password=" do
    it "文字列を与えるとhashed_passwordは６０文字の文字列になる" do
      person = Administrator.new
      person.password = "Combee"
      expect(person.hashed_password).to be_kind_of(String)
      expect(person.hashed_password.size).to eq(60)
    end

    example "nilを与えると、hashed_passeordはnilになる" do
      member = StaffMember.new(hashed_password: "x")
      member.password = nil
      expect(member.hashed_password).to be nil
    end
  end
end
