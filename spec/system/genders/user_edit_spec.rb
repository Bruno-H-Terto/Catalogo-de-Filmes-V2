require 'rails_helper'

RSpec.describe 'Edit', type: :system do
  context 'success' do
    it 'successfully edits a gender' do
      gender = Gender.create!(name: 'Comédia')

      visit "/genders/#{gender.id}"

      click_on 'Editar'

      fill_in 'Name', with: 'Ação'
      click_on 'Enviar'

      expect(page).to have_content 'Gênero atualizado com sucesso'
    end
  end
end