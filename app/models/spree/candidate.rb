module Spree
  class Candidate < ActiveRecord::Base
    has_many :entries, class_name: 'Spree::Entry'
    has_many :prizes, through: :entries, class_name: 'Spree::Prize'
    belongs_to :winable, polymorphic: true

    validates :email, presence: true, uniqueness: { case_sensitive: false }
  end
end
