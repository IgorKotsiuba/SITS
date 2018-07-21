require 'rails_helper'

describe Manager::TicketsController, type: :controller do
  let!(:manager) { create :manager }

  describe 'GET #index' do
    context 'unauthenticated' do
      before { get :index }
      it { expect(response).to redirect_to manager_root_path }
    end

    context 'authenticated' do
      before { sign_in manager, :manager }
      before { get :index }
      it { expect(response).to be_successful }
    end
  end

  describe 'GET #show' do
    let!(:ticket) { create :ticket }

    context 'unauthenticated' do
      before { get :show, params: { reference_uuid: ticket.reference_uuid } }
      it { expect(response).to redirect_to manager_root_path }
    end

    context 'authenticated' do
      before { sign_in manager, :manager }

      context 'success' do
        before { get :show, params: { reference_uuid: ticket.reference_uuid } }

        it { expect(response).to be_successful }
      end
    end
  end
end
