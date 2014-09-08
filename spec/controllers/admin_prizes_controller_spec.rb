require 'spec_helper'

RSpec.describe Spree::Admin::PrizesController, type: :controller do
  let(:user) { mock_model(Spree::User).as_null_object }
  let(:prize) { build_stubbed :prize, :active }

  before(:each) do
    controller.stub(:spree_current_user).and_return(user)
    user.stub(:generate_spree_api_key!).and_return(true)
    controller.stub(:authorize!).and_return(true)
    controller.stub(:authorize_admin).and_return(true)
  end

  describe 'GET #new' do
    it 'renders the #new template' do
      get :new, use_route: :spree
      expect(response).to render_template(:new)
    end

    it 'assigns a @prize object' do
      get :new, use_route: :spree
      expect(assigns[:prize]).to be_an_instance_of(Spree::Prize)
    end
  end

  describe 'POST #create' do
    it 'adds a new prize to the database' do
      expect{
        post :create, prize: attributes_for(:prize), use_route: :spree
      }.to change(Spree::Prize, :count).by(1)
    end

    it 'saves all prize fields to the database' do
      prize = attributes_for(:prize, title: 'Boombot Rex', description: 'Lorem ipsum', begin_time: DateTime.new(2014, 07, 19, 20, 00, 00), end_time: DateTime.new(2014, 07, 20, 15, 00, 00))
      post :create, prize: prize, use_route: :spree
      expect(Spree::Prize.last.title).to eq('Boombot Rex')
      expect(Spree::Prize.last.description).to eq('Lorem ipsum')
      expect(Spree::Prize.last.begin_time).to eq(DateTime.new(2014, 07, 19, 20, 00, 00))
      expect(Spree::Prize.last.end_time).to eq(DateTime.new(2014, 07, 20, 15, 00, 00))
    end

    it 'redirects to the prizes index' do
      post :create, prize: attributes_for(:prize), use_route: :spree
      expect(response).to redirect_to('/admin/prizes')
    end
  end

  describe 'GET #edit' do
    before :each do
      @prize = create(:prize, :active)
      get :edit, id: @prize, use_route: :spree
    end

    it 'renders the #edit template' do
      expect(response).to render_template(:edit)
    end

    it 'assigns the @prize object' do
      expect(assigns[:prize]).to eq(@prize)
    end
  end

  describe 'PUT #update' do

    context 'success / good data' do
      it 'saves updates to the database' do
        prize = create(:prize, :active, title: 'Hello, World!')
        post :update, id: prize, prize: attributes_for(:prize, title: 'Hello, Boombot!'), use_route: :spree
        prize.reload
        expect(prize.title).to eq('Hello, Boombot!')
      end

      it 'redirects to the admin prizes index' do
        prize = create(:prize, :active, title: 'Hello, World!')
        post :update, id: prize, prize: attributes_for(:prize, title: 'Hello, Boombot!'), use_route: :spree
        expect(response).to redirect_to('/admin/prizes')
      end
    end

    context 'bad data / failure' do
      it 'renders the edit page' do
        skip
      end

      it 'returns error messages' do
        skip
      end
    end
  end

  describe 'GET #show' do
    skip
  end

  describe 'PUT #destroy' do
    skip
  end
end
