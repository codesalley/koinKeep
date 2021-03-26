require 'rails_helper'

RSpec.describe TransactionsController do
fixtures :users 

context " data and user authentication" do 
  scenario "non login users should be restricted from accessing transactions data " do 
    get :new
    expect(response.status).to eq(302)
  end
  scenario "logged users can access and create Transactions " do 
      sign_in(users(:salley))
      expect(response.status).to eq(200)
    end
  end

end
