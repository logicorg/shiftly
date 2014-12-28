class Time
  def shift
    if self.hour < 6
      3
    elsif self.hour < 14
      1
    elsif self.hour < 22
      2
    else
      3
    end
  end

  def shift_beg
    Time.new(self.year, self.month, self.day, (shift * 8) - 2, 0, 0)
  end

  def shift_end
    shift_beg + 8.hours - 1.second
  end

  def to_factory_date
    self.hour < 6 ? 1.business_day.before(self.to_date) : self.to_date
  end
end