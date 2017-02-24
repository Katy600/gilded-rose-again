require_relative 'item'

class StandardItem < Item
  QUALITY_REDUCTION_BEFORE_SELL_IN = 1
  QUALITY_REDUCTION_AFTER_SELL_IN = 2
  SELL_IN_REDUCTION = 1

  def update_quality
    self.sell_in <= 0 ? past_sell_by_date : within_sell_by_date
    prevent_quality_from_going_below_zero
  end

  def within_sell_by_date
    sell_in_decreases_by_one
    quality_decreases_by_one
  end

  def past_sell_by_date
    sell_in_decreases_by_one
    quality_decreases_by_two
  end

  def sell_in_decreases_by_one
    self.sell_in -= SELL_IN_REDUCTION
  end

  def quality_decreases_by_two
    self.quality -= QUALITY_REDUCTION_AFTER_SELL_IN
  end

  def quality_decreases_by_one
    self.quality -= QUALITY_REDUCTION_BEFORE_SELL_IN
  end

  def prevent_quality_from_going_below_zero
    self.quality = 0  if (self.quality <= 0) && (self.sell_in <= 0)
  end
end
