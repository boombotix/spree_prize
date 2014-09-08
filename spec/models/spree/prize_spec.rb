require 'spec_helper'

RSpec.describe Spree::Prize, type: :model do
  it 'requires a begin_time' do
    prize = build :prize, begin_time: nil
    expect(prize).to_not be_valid
  end

  it 'requires an end time' do
    prize = build :prize, end_time: nil
    expect(prize).to_not be_valid
  end

  describe 'Spree::Prize.active?' do
    it 'returns true if the prize is active' do
      prize = create :prize, :active
      expect(prize.active?).to eq(true)
    end
    it 'returns false if the prize is not active' do
      prize = create :prize, :past_prize
      expect(prize.active?).to eq(false)
    end
  end

  describe 'Spree::Prize.active' do
    before do
      3.times { create :prize, :active }
      5.times { create :prize, :past_prize }
    end

    it 'lists currently active prizes' do
      expect(Spree::Prize.active.length).to eq(3)
    end
  end

  describe 'Spree::Prize.choose_winner' do
    it 'selects a winner from an array of candidates' do
      prize = create(:prize_with_entries, :past_prize, entries_count: 1)
      expect(prize.choose_winner).to be_an_instance_of(Spree::Candidate)
    end
  end
end
