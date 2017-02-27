require_relative 'item'

class BackStagePass < Item

  SELL_IN_REDUCTION = 1

  def update_quality
    if @sell_in > 10
       @quality += 1
      sell_in_decreases_by_one
    elsif (@sell_in <= 10) and (@sell_in > 5)
      @quality += 2
      sell_in_decreases_by_one
    elsif (@sell_in <= 5) and (@sell_in > 0)
      @quality += 3
      sell_in_decreases_by_one
    else
       @quality = 0
    end
  end

  def sell_in_decreases_by_one
    @sell_in -= SELL_IN_REDUCTION
  end

end
