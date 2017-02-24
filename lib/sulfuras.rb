require_relative 'item'

class Sulfuras < Item
  def update_quality
    self.sell_in += 0
  end
end
