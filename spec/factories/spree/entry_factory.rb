FactoryGirl.define do
  factory :entry, class: 'Spree::Entry' do
    association :candidate
    association :prize
  end
end
