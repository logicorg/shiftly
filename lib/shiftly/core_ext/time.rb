class Time
  def shift
    if self.hour < Shiftly::Config.day_start_hour
      3
    elsif self.hour < Shiftly::Config.day_start_hour + Shiftly::Config.shift_hours
      1
    elsif self.hour < Shiftly::Config.day_start_hour + 2 * Shiftly::Config.shift_hours
      2
    else
      3
    end
  end

  def shift_beg
    Time.new(self.year, self.month, self.day, Shiftly::Config.day_start_hour + ((shift - 1) * Shiftly::Config.shift_hours), 0, 0)
  end

  def shift_end
    shift_beg + Shiftly::Config.shift_hours.hours - 1.second
  end

  def to_factory_date
    self.hour < Shiftly::Config.day_start_hour ? 1.business_day.before(self.to_date).to_date : self.to_date
  end
end