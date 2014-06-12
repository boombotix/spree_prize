FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_prize/factories'

  factory :candidate, class: 'Spree::Candidate' do
    sequence(:email) { |n| "person#{n}@example.com" }
  end

  factory :prize, class: 'Spree::Prize' do
    title 'Boombot Rex'
    description 'The Boombot REX is the next evolution of ultraportable smart-speakers. With revolutionary acoustic and industrial design, a noise-canceling microphone and a built-in clip, the REX allows you to stay connected to your friends and your music while keeping your phone safely in your pocket.'

    trait :active do
      begin_time { 2.days.ago }
      end_time { DateTime.now + 1.day }
    end

    trait :past_prize do
      begin_time { 1.week.ago }
      end_time { 1.day.ago }
    end

    trait :has_candidates do
      after(:create) do |prize|
        25.times { prize.candidates << FactoryGirl.create(:candidate) }
      end
    end
  end
end
