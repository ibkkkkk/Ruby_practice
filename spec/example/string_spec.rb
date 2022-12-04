require "spec_helper"

describe String do 
  describe "#<<" do
    example "文字の追加" do
      s = "ABC"
      s << "D"
      expect(s.size).to eq(4)
    end
    example "can't append nil", :exception do
    # xexample "nilの追加" do
      # pending(" ")
      s = "ABC"
      expect{ s << nil }.to raise_error(TypeError)
      # expect(s.size).to eq(4)
    end
  end
end

