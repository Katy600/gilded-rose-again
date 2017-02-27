require_relative 'item'

class BackStagePass < Item

  SELL_IN_REDUCTION = 1

  def update_quality
    case
      when sell_in_is_greater_than_ten  then  addOne and decreases_sell_in_by_one
      when sell_in_is_ten_or_less       then  addTwo and decreases_sell_in_by_one
      when sell_in_is_five_or_less      then  addThree and decreases_sell_in_by_one
    else
      @quality = 0
    end
  end

  def sell_in_is_greater_than_ten
    @sell_in > 10
  end

  def sell_in_is_ten_or_less
    (@sell_in <= 10) and (@sell_in > 5)
  end

  def sell_in_is_five_or_less
     (@sell_in <= 5) and (@sell_in > 0)
  end

  def decreases_sell_in_by_one
    @sell_in -= SELL_IN_REDUCTION
  end

  def addOne
    @quality += 1
  end

  def addTwo
    @quality += 2
  end

  def addThree
    @quality += 3
  end

end
