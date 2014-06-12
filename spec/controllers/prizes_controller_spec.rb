require 'spec_helper'

describe Spree::PrizesController do
  let(:test_candidates) { create_list(:candidate, 25) }
  let(:active_prizes) { create_list(:prize, 2, :active) }
  let(:past_prizes) { create_list(:prize, 25, :past_prize) }
  
  before :each do 
    active_prizes
    past_prizes.each do |p|
      p.candidates << test_candidates
      p.choose_winner
    end
    get :index, :use_route => :spree
  end

  describe 'GET #index' do
    it 'has an array of active prizes' do
      expect(assigns[:prizes].length).to eq(2)
    end

    it 'has an array of winners' do
      expect(assigns[:winners].length).to_not be_nil
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end
  end
end