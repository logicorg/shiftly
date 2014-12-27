require 'shiftly'
require 'active_support/time'

describe Time do
  context 'next_shift' do
    it { expect(1.next_shift).to eq 2 }
    it { expect(2.next_shift).to eq 3 }
    it { expect(3.next_shift).to eq 1 }
  end

  context 'prev_shift' do
    it { expect(1.prev_shift).to eq 3 }
    it { expect(2.prev_shift).to eq 1 }
    it { expect(3.prev_shift).to eq 2 }
  end
end