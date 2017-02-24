require_relative 'item'

class AgedBrie < Item
  SELL_IN_REDUCTION = 1
  QUALITY_INCREASE_BEFORE_SELL_IN = 1
  QUALITY_INCREASE_AFTER_SELL_IN = 2
  MAXIMUM_QUALITY = 50

  def update_quality
    self.sell_in <= 0 ? past_sell_by_date : within_sell_by_date
    quality_does_not_exceed_fifty
  end

  def within_sell_by_date
    sell_in_decreases_by_one
    quality_increases_by_one
  end

  def sell_in_decreases_by_one
    self.sell_in -= SELL_IN_REDUCTION
  end

  def quality_increases_by_one
    self.quality += QUALITY_INCREASE_BEFORE_SELL_IN
  end

  def quality_increases_by_two
    self.quality += QUALITY_INCREASE_AFTER_SELL_IN
  end

  def past_sell_by_date
    sell_in_decreases_by_one
    quality_increases_by_two
  end

  def quality_does_not_exceed_fifty
    self.quality = MAXIMUM_QUALITY if self.quality >= MAXIMUM_QUALITY
  end

end
