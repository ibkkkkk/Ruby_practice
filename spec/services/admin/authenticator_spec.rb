require "rails_helper"

describe Admin::Authenticator do
  describe "#autheticate" do

    example "if password true" do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "inccorrect password? false" do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate("xy")).to be_falsey
    end

    # example "if unsetted password? false" do
    #   m = build(:administrator, password: nil)
    #   expect(Admin::Authenticator.new(m).authenticate(nil)).to be_falsey
    # end

    example "if 停止フラグ? false" do
      m = build(:administrator, suspended: true)
      expect(Admin::Authenticator.new(m).authenticate("pw")).to be_truthy
    end
  end
end
