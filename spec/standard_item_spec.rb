require 'standard_item'
# require 'item'

describe StandardItem do
  describe "#update_quality" do
    it "does not change the name" do
      item = StandardItem.new("foo", 0, 0)
      p item
      expect(item.name).to eq "foo"
    end

    it "decreases the quality value by 1" do
      item = StandardItem.new("foo", 5, 10)
      expect {item.update_quality}.to change {item.quality}.by(-1)
    end

    it "decreases the quality by 2 after the sell_in has reached 0" do
      item = StandardItem.new("foo", 0, 10)
      expect {item.update_quality}.to change {item.quality}.by(-2)
    end

    it "Quality of an item is never negative" do
      item = StandardItem.new("foo", 0, 0)
      expect {item.update_quality}.not_to change {item.quality}
    end
  end
end
