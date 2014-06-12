module Spree
  module Admin
    module Prizes
      class CandidatesController < Spree::Admin::BaseController

        def update
          @candidate = Spree::Candidate.find(params[:id])
          if @candidate.update(candidate_params)
            redirect_to admin_prize_path(params[:prize_id]), notice: 'Candidate was successfully updated.'
          else
            render action: "edit"
          end
        end

        def destroy
          @candidate = Spree::Candidate.find(params[:id])
          @candidate.destroy
          redirect_to admin_prize_path(params[:prize_id]), notice: "Candidate was successfully deleted."
        end

        def edit
          @prize = Spree::Prize.find(params[:prize_id])
          @candidate = Spree::Candidate.find(params[:id])
        end

        private
          def candidate_params
            params.require(:candidate).permit(:name, :email, :state, :city)
          end
      end
    end
  end
end
