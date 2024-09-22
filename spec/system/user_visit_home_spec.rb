require 'rails_helper'

RSpec.describe 'Home', type: :system do
  context 'navigation' do
    it 'view logo in home page' do
      visit root_path
      expect(page).to have_content('Catalogo de Filmes')
    end

    it 'view options for genders' do
      visit root_path
      link = find('nav a', text: 'Gêneros')
      expect(link[:href]).to eq('#gender')
      expect(page).to have_css('#gender h2', text: 'Gêneros')
      expect(page).to have_css('#gender a', text: 'Novo')

    end
  end

  context 'redirections links' do
    it 'click on link for new gender' do
      visit root_path
      within('#gender') do
        click_on 'Novo'
      end

      expect(current_path).to eq new_gender_path
      expect(page).to have_content 'Novo Gênero'
    end
  end
end