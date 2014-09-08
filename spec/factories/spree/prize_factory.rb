FactoryGirl.define do
  factory :prize, class: 'Spree::Prize' do
    begin_time Time.now
    end_time Time.now + 1.day
    title "Boombot Rex"
    description "The Boombot REX is the next evolution of ultraportable smart-speakers"

    trait :active do
      begin_time Time.now
      end_time Time.now + 1.day
    end

    trait :past_prize do
      begin_time Time.now - 2.days
      end_time Time.now - 1.day
    end

    factory :prize_with_entries do
      ignore do
        entries_count 1
      end

      after(:create) do |prize, evaluator|
        prize.entries = create_list(:entry, evaluator.entries_count, prize: prize)
      end
    end
  end
end
