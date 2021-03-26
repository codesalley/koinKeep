require 'rails_helper'

RSpec.describe HomeController do
  describe 'get home page' do
    it 'User should be redirected to sign-in page' do
      get :index
      expect(response).to have_http_status(302)
      assert_redirected_to(controller: 'devise/sessions', action: 'new')
    end
  end
end
