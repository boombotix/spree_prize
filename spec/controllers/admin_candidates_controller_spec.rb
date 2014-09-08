require 'spec_helper'

describe Spree::Admin::Prizes::CandidatesController do
  let(:prize) { create :prize, :active }
  let(:candidate) { create :candidate }
  let(:user) { mock_model(Spree::User).as_null_object }

  before(:each) do
    controller.stub(:spree_current_user).and_return(user)
    user.stub(:generate_spree_api_key!).and_return(true)
    controller.stub(:authorize!).and_return(true)
    controller.stub(:authorize_admin).and_return(true)
  end

  describe '#update' do

    it 'updates the candidate attributes' do
      candidate = create(:candidate, name: 'John Smith')
      post :update, id: candidate, prize_id: prize, candidate: attributes_for(:candidate, name: 'Johnny Appleseed'), use_route: :spree
      candidate.reload
      expect(candidate.name).to eq('Johnny Appleseed')
    end

    it 'redirects to the prizes#show page on success' do
      skip 'missing test'
    end

    it 're-renders the #edit view on error' do
      skip 'missing test'
    end

  end

  describe '#destroy' do
    skip 'missing test'
  end

  describe '#edit' do
    skip 'missing test'
  end

end
