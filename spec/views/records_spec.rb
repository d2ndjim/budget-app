require 'rails_helper'

RSpec.feature 'Record new', type: :feature do
  before(:each) do
    @user = User.create! name: 'Tom', email: 'tom@example.com', password: 'password'
    @category = Category.create(name: 'Shopping', icon: fixture_file_upload('budget.png'), user_id: @user.id)

    visit user_session_path
    fill_in 'Email', with: 'tom@example.com'
    fill_in 'Password', with: 'password'
    click_button
    visit category_path(@category)
    click_link('New Transaction')
  end

  it 'Navigate to the create transaction' do
    expect(page).to have_current_path(new_category_record_path(@category))
  end

  it 'show Add Transcation heading' do
    expect(page).to have_content 'New Transaction'
  end

  it 'display success message' do
    fill_in 'Name', with: 'eggs'
    fill_in 'Amount', with: 10
    click_button 'Create Record'
    expect(page).to have_content 'Transaction was successfully created.'
  end
end
