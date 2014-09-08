FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :candidate, class: 'Spree::Candidate' do
    name 'Foo Johnson'
    email
  end
end

