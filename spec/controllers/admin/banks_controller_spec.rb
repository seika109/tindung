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

    def do_request
      post :create, bank: bank_params
    end

    before { sign_in admin }

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
end

