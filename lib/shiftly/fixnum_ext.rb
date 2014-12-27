Fixnum.class_eval do

  def next_shift
    self == 3 ? 1 : self + 1
  end

  def prev_shift
    self == 1 ? 3 : self - 1
  end
end