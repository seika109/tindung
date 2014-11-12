require 'rails_helper'

describe Admin::BanksController do
  let!(:admin) { create :admin }

  describe 'GET #index' do
    let!(:bank) { create_list :bank,3 }

    before { sign_in admin }

    def do_request
      get :index
    end


    it 'renders list of banks' do
      do_request

      expect(response).to render_template :index
      expect(assigns(:banks).size).to eq 3
    end
  end

  describe 'GET #new' do
    let!(:bank) { create_list :bank,3 }

    before { sign_in admin }

    def do_request
      get :new
    end

    it 'renders :new template' do
      do_request

      expect(assigns(:banks).size).to eq 3
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let!(:bank_params) { attributes_for(:bank) }

    before { sign_in admin }

    def do_request
      post :create, bank: bank_params
    end


    context 'when params is valid' do
      it 'creates a new bank' do
        do_request

        expect(response).to redirect_to admin_banks_url
        expect(Bank.count).to eq 1
      end
    end

    context 'when params is invalid' do
      it 'can not create a new bank' do
        bank_params[:name]= ''
        do_request

        expect(Bank.count).to eq 0
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    let!(:bank)   { create :bank }
    let!(:banks) { create_list :bank, 2 }

    before { sign_in admin }

    def do_request
      get :edit, id: bank.id
    end

    it 'renders :edit template' do
      do_request

      expect(response).to render_template :edit
      expect(assigns(:bank)).to eq bank
      expect(assigns(:banks).size).to eq 3
    end
  end

  describe 'PATCH #update' do
    context 'when params is valid' do
      let!(:bank) { create :bank }

      before { sign_in admin }

      def do_request
        patch :update, id: bank.id, bank: { name: 'Bank ABC' }
      end

      it 'update bank' do
        do_request

        expect(assigns(:bank).name).to eq 'Bank ABC'
        expect(response).to redirect_to admin_banks_url
        expect(flash[:notice]).not_to be_nil
      end
    end

    context 'when params is invalid' do

    end
  end
end

