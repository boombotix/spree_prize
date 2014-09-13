module Spree
  class Candidate < ActiveRecord::Base
    has_many :entries, class_name: 'Spree::Entry'
    has_many :prizes, through: :entries, class_name: 'Spree::Prize'
    belongs_to :winable, polymorphic: true

    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: /@/

    after_create :newsletter_signup

    def newsletter_signup
      # override this in your own application
    end
  end
end
