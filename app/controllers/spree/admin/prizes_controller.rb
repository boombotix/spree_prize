module Spree
  module Admin
    class PrizesController < Spree::Admin::BaseController
      def new
        @prize = Spree::Prize.new
      end

      def create
        @prize = Spree::Prize.new(prize_params)
        respond_to do |format|
          if @prize.save
            format.html { redirect_to admin_prizes_url, notice: 'Prize was successfully created.' }
            format.json { render json: @prize, status: :created, location: @prize }
          else
            format.html { render action: 'new', notice: @prize.errors.full_messages.to_sentence }
            format.json { render json: @prize.errors, status: :unprocessable_entity }
          end
        end
      end

      def edit
        @prize = Spree::Prize.find(params[:id])
      end

      def update
        @prize = Spree::Prize.find(params[:id])
        respond_to do |format|
          if @prize.update(prize_params)
            format.html { redirect_to admin_prizes_url, notice: 'Prize was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit', notice: @prize.errors.full_messages.to_sentence }
            format.json { render json: @prize.errors, status: :unprocessable_entity }
          end
        end
      end

      def winner
        @prize = Spree::Prize.find(params[:id])
        if @prize.choose_winner
          redirect_to admin_prize_path(@prize), notice: 'Successfully chose winner.'
        else
          redirect_to admin_prize_path(@prize), notice: 'Unable to choose a winner'
        end
      end

      def show
        @prize = Spree::Prize.find(params[:id])
        @candidates = @prize.candidates
      end

      def destroy
        @prize = Spree::Prize.find(params[:id])
        @prize.destroy

        respond_to do |format|
          format.html { redirect_to admin_prizes_url, notice: 'Prize was successfully deleted.' }
          format.js { head :no_content }
          format.json { head :no_content }
        end
      end

      private

      def prize_params
        params.require(:prize).permit(:title, :begin_time, :end_time, :description, :image, :image_file_name)
      end
    end
  end
end
