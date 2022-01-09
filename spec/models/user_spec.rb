require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'when a user is created with a given username' do
    context 'when the username already exists' do
      it 'does not create and raises with an already existing error' do
        username = 'Countess'
        existing_user = create(:user, email: 'ladyadalovelace@test.com', username: username)
        error = 'Username already exists'

        # expect(existing_user.username).to eq 'Countess'
        # create(:user, email: 'lady_danbury@test.com', username: 'Countess')
      end
    end
  end
end