module Spree
  class PrizesController < Spree::BaseController

    def index
      @prizes = Spree::Prize.active
      @winners = Spree::Candidate.where(winable_type:'Spree::Prize').where("winable_id IS NOT NULL")
    end

    # def show
    #   @prize      = Spree::Prize.find(params[:id])
    #   @candidates = @prize.candidates
    # end

  end
end
