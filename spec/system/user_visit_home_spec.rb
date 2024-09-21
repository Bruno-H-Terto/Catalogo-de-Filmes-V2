require 'rails_helper'

RSpec.describe 'Home', type: :system do
  it 'view home page' do
    visit root_path
    expect(page).to have_content('Welcome')
  end
end