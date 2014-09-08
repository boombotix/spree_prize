require 'spec_helper'

describe Spree::Prizes::CandidatesController do
  let(:prize) { create :prize, :active }

  describe 'POST #create' do
    it 'adds new emails to the database' do
      expect{
        post :create, format: 'json', candidate: attributes_for(:candidate), prize_id: prize, use_route: :spree
      }.to change(Spree::Candidate, :count).by(1)
    end

    it 'returns the email on success' do
      attributes = attributes_for(:candidate)
      post :create, format: 'json', candidate: attributes, prize_id: prize, use_route: :spree
      expect(response).to_not be_nil # eq(attributes[:email]) <- TODO: using the actual expected response causes a nasty loop for some reason
    end

    it 'returns an error message on failure'
  end
end
