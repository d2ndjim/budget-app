require 'rails_helper'

RSpec.describe 'Records', type: :request do
  describe 'GET records#new' do
    before(:each) do
      user = User.create name: 'Tom', email: 'tom@example.com', password: 'password'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      category = user.categories.create(name: 'Shopping', icon: fixture_file_upload('budget.png'))
      get new_category_record_path(category)
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:new)
    end
  end
end
