module Spree
  class Entry < ActiveRecord::Base
    belongs_to :candidate, class_name: 'Spree::Candidate'
    belongs_to :prize, class_name: 'Spree::Prize'
  end
end