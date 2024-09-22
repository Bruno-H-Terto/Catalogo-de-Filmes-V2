require 'rails_helper'

RSpec.describe 'Genders', type: :system do
  context 'success' do
    it 'successfully creates a new gender' do
      visit new_gender_path 

      fill_in 'Name', with: 'Ação'
      click_on 'Enviar'

      expect(page).to have_content 'Gênero salvo com sucesso'
      expect(page).to have_content 'Ação'
    end
  end

  context 'failure' do
    it 'fails to create a new gender with the same name' do
      Gender.create!(name: 'Terror')
      visit new_gender_path 

      fill_in 'Name', with: 'Terror'
      click_on 'Enviar'


      expect(page).to have_content 'Não foi possível concluir esta operação.'
      expect(page).to have_content 'Novo Gênero'
      expect(page).to have_field 'Name'
    end
  end
end
