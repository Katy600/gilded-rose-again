require 'sulfuras'

describe Sulfuras do
  it "sell_in does not change" do
    item = Sulfuras.new("Sulfuras, Hand of Ragnaros", 10, 50)
    expect {item.update_quality()}.not_to change {item.sell_in}
  end

  it "Quality does not change" do
    item = Sulfuras.new("Sulfuras, Hand of Ragnaros", 10, 50)
    expect {item.update_quality()}.not_to change {item.quality}
  end
end
