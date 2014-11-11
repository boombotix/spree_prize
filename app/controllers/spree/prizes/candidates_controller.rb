module Spree
  module Prizes
    class CandidatesController < Spree::BaseController

      def create
        @candidate = Spree::Candidate.find_or_create_by(email: candidate_params['email'])
        @prize = Spree::Prize.find(params[:prize_id])
        # Prevent candidates from signing up multiple times
        if !@prize.candidates.include?(@candidate)
          @candidate.prizes << @prize
          if @candidate.save
            respond_to do |f|
              f.json {
                render json: {
                  message: "You're in. Good luck!"
                }
              }
            end
          else
            respond_to do |f|
              f.json {
                render(
                  status: 422,
                  json: {
                    message: response_error_message
                  }
                )
              }
            end
          end
        else
          respond_to do |f|
            f.json {
              render json: {
                message: "You've already been entered!" 
              }
            }
          end
        end

      end

        private

        def candidate_params
          params.require(:candidate).permit(:email)
        end

        def response_error_message
          @candidate.errors.messages.inject("") { |msg, err|
            msg << err.join(' ');
            msg
          }
        end

    end
  end
end
