require 'aged_brie'

describe 'AgedBrie' do
  it "Quality increases by 1 before sell_in reaches 0" do
    item = AgedBrie.new("Aged Brie", 5, 5)
    expect {item.update_quality()}.to change {item.quality}.by(1)
  end
end
