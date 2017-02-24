require 'aged_brie'

describe 'AgedBrie' do
  it "Quality increases by 1 before sell_in reaches 0" do
    item = AgedBrie.new("Aged Brie", 5, 5)
    expect {item.update_quality()}.to change {item.quality}.by(1)
  end

  it "Quality of 'Aged Brie' increases by 2 after sell_in reaches 0" do
    item = AgedBrie.new("Aged Brie", 0, 5)
    expect {item.update_quality()}.to change {item.quality}.by(2)
  end

  it "Quality never goes above 50" do
    item = AgedBrie.new("Aged Brie", 0, 50)
    expect {item.update_quality()}.not_to change {item.quality}
  end
end
