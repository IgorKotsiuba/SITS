require 'rails_helper'

describe Manager::SessionsController, type: :controller do
  let!(:manager) { create :manager, username: 'Riki', password: '123456789' }

  describe 'GET #new' do
    context 'authenticated' do
      before { sign_in manager, :manager }
      before { get :new }
      it { expect(response).to redirect_to manager_tickets_path }
    end

    context 'unauthenticated' do
      before { get :new }
      it { expect(response).to be_successful }
    end
  end

  describe 'POST #create' do
    context 'authenticated' do
      before { sign_in manager, :manager }
      before { get :new }
      it { expect(response).to redirect_to manager_tickets_path }
    end

    context 'unauthenticated' do
      context 'valid params' do
        before do
          post :create, params: {
            'manager' => {
              'username' => manager.username,
              'password' => '123456789'
            }
          }
        end
        it { expect(response).to redirect_to manager_tickets_path }
        it { expect(signed_user(:manager_id)).to eq manager.id }
      end

      context 'invalid params' do
        before do
          post :create, params: {
            'manager' => {
              'email' => manager.username,
              'password' => 'invalid_password'
            }
          }
        end
        it { expect(response).to be_successful }
        it { expect(signed_user(:manager_id)).to be_blank }
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'authenticated' do
      before { sign_in manager, :manager }
      before { delete :destroy }

      it { expect(response).to redirect_to manager_root_path }
      it { expect(signed_user(:manager_id)).to be_blank }
    end

    context 'unauthenticated' do
      before { delete :destroy }

      it { expect(response).to redirect_to manager_root_path }
      it { expect(signed_user(:manager_id)).to be_blank }
    end
  end
end
