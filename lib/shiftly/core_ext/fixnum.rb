class Fixnum

  def next_shift
    self == Shiftly::Config.number_of_shifts ? 1 : self + 1
  end

  def prev_shift
    self == 1 ? Shiftly::Config.number_of_shifts : self - 1
  end
end