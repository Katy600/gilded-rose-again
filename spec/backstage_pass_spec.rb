require 'backstage_pass'

describe BackStagePass do
  it "Backstage passes increases in quality by 1 when sell_in is greater than 10" do
    item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)
    expect {item.update_quality()}.to change {item.quality}.by(1)
  end

  it "Backstage passes increases in quality by 2 when sell_in is 10 or less" do
    item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 9, 10)
    expect {item.update_quality()}.to change {item.quality}.by(2)
  end

  it "Backstage passes increases in quality by 3 when sell_in is 5 or less" do
    item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 4, 10)
    expect {item.update_quality()}.to change {item.quality}.by(3)
  end

  it "Backstage passes quality drops to 0 when sell_in is 0" do
    item = BackStagePass.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
    item.update_quality
    expect(item.quality).to eq 0
  end
end
