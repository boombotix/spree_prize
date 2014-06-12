require 'spec_helper'

describe Spree::Candidate do
  it 'validates the presence of an email' do
    candidate = FactoryGirl.build :candidate, email: nil
    expect(candidate).to_not be_valid
  end

  it 'validates the uniqness of an email' do
    candidate1 = FactoryGirl.create :candidate, email: 'hello@world.org'
    candidate2 = FactoryGirl.build :candidate, email: 'hello@world.org'
    expect(candidate2).to_not be_valid
  end

end