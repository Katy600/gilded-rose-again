require_relative 'item'

class AgedBrie < Item
  SELL_IN_REDUCTION = 1

  def update_quality
    within_sell_by_date
  end

  def within_sell_by_date
    sell_in_decreases_by_one
    quality_increases_by_one
  end

  def sell_in_decreases_by_one
    self.sell_in -= SELL_IN_REDUCTION
  end

  def quality_increases_by_one
    self.quality += 1
  end
end
