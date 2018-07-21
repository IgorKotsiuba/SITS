require 'rails_helper'

RSpec.describe Customer::TicketsController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it { expect(response).to be_successful }
  end

  describe 'POST #create' do
    context 'success' do
      let(:params) do
        {
          ticket: {
            customer_name:  'Riki',
            customer_email: 'test@example.com',
            subject:        'Problem with Cell Pnone',
            body:           'I run out of money',
            department_id:  1
          }
        }
      end

      before { post :create, params: params }

      it { expect(response).to redirect_to Ticket.last }
    end

    context 'invalid params' do
      let(:params) do
        {
          ticket: {
          }
        }
      end

      before { post :create, params: params }

      it { expect(response).to be_successful }
    end
  end

  describe 'GET #show' do
    let!(:ticket) { create :ticket }

    context 'success' do
      before { get :show, params: { reference_uuid: ticket.reference_uuid } }

      it { expect(response).to be_successful }
    end

    context 'fail' do
      it 'referance number not found' do
        expect { get :show, params: { reference_uuid: 'AAA-111' } }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
