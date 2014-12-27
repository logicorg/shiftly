require 'shiftly'
require 'active_support/time'

describe Time do
  let(:date) { Date.today }
  let(:day_beg) { Time.new(date.year, date.month, date.day, 0, 0, 0) }
  let(:day_end) { Time.new(date.year, date.month, date.day, 23, 59, 59) }

  let(:shift1_beg) { Time.new(date.year, date.month, date.day, 6, 0, 0) }
  let(:shift1_mid) { Time.new(date.year, date.month, date.day, 11, 22, 33) }
  let(:shift1_end) { Time.new(date.year, date.month, date.day, 13, 59, 59) }

  let(:shift2_beg) { Time.new(date.year, date.month, date.day, 14, 0, 0) }
  let(:shift2_mid) { Time.new(date.year, date.month, date.day, 15, 16, 17) }
  let(:shift2_end) { Time.new(date.year, date.month, date.day, 21, 59, 59) }

  let(:shift3_beg) { Time.new(date.year, date.month, date.day, 22, 0, 0) }
  let(:shift3_mid) { Time.new(date.year, date.month, date.day, 22, 23, 24) }
  let(:shift3_end) { Time.new(date.year, date.month, date.day, 5, 59, 59) }

  context 'to_factory_date' do
    it { expect(day_beg.to_factory_date).to eq date - 1.day }
    it { expect(shift3_end.to_factory_date).to eq date - 1.day }
    it { expect(shift1_beg.to_factory_date).to eq date }
    it { expect(day_end.to_factory_date).to eq date }
  end

  context 'shift' do
    it { expect(shift1_beg.shift).to eq 1 }
    it { expect(shift1_end.shift).to eq 1 }
    it { expect(shift2_beg.shift).to eq 2 }
    it { expect(shift2_end.shift).to eq 2 }
    it { expect(shift3_beg.shift).to eq 3 }
    it { expect(shift3_end.shift).to eq 3 }
  end

  context 'shift_beg' do
    it { expect(shift1_mid.shift_beg).to eq shift1_beg }
    it { expect(shift1_mid.shift_end).to eq shift1_end }
    it { expect(shift2_mid.shift_beg).to eq shift2_beg }
    it { expect(shift2_mid.shift_end).to eq shift2_end }
    it { expect(shift3_mid.shift_beg).to eq shift3_beg }
    it { expect(shift3_mid.shift_end).to eq shift3_end + 1.day }
  end
end