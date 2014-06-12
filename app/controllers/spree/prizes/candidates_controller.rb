module Spree
  module Prizes
    class CandidatesController < Spree::BaseController

      def create
        @candidate = Spree::Candidate.find_or_create_by(email:candidate_params['email'])
        @prize = Spree::Prize.find(params[:prize_id])

        # Prevent candidates from signing up multiple times
        unless @prize.candidates.include?(@candidate)
          @candidate.prizes << @prize
        end

        if @candidate.save
          # TODO: Sign up Candidate email to Listrak
          respond_to do |f|
            f.json { render json: @candidate.email }
          end
        else
          respond_to do |f|
            f.json { render json: @candidate.errors.messages }
          end
        end
      end

      private
        def candidate_params
          params.require(:candidate).permit(:email)
        end

    end
  end
end
