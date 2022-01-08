require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'methods' do
    describe '#create_magic_link' do
      let(:email) { 'ladydaphne@bridgerton.com' }

      before do
        create(:user, email: email)
      end

      it 'responds successfully when given a valid user email' do
        request.env['devise.mapping'] = Devise.mappings[:user]
        post :create_magic_link, params: { email: email }

        expect(response.status).to eq 302
      end

      it 'responds with an error when the params are invalid' do
        request.env['devise.mapping'] = Devise.mappings[:user]

        post :create_magic_link, params: { email: 'doesnt_exist' }

        expect(response.status).to eq 302
      end
    end
  end
end