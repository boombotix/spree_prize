require 'spec_helper'

describe Spree::Candidate do
  it 'validates the presence of an email' do
    candidate = build(:candidate, email: nil)
    expect(candidate).to_not be_valid
  end

  it 'validates the uniqness of an email' do
    candidate1 = create(:candidate)
    candidate2 = build(:candidate, email: candidate1.email)
    expect(candidate2).to_not be_valid
  end
end
