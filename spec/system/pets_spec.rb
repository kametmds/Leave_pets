require 'rails_helper'
# bundle exec rspec spec/system/pets_spec.rb
# bin/rspec spec/system/pets_spec.rb
RSpec.describe 'Pets', type: :system do
  before do
    @pet = FactoryBot.create(:pet)
    @pet2 = FactoryBot.create(:second_pet)
    @pet3 = FactoryBot.create(:third_pet)
  end
  describe 'ペット管理機能' do
    it 'ペット一覧のテスト' do
      visit pets_path
      expect(page).to have_content "ポチ"
      expect(page).to have_content "タマ"
      expect(page).to have_content "ミケ"
    end
    it 'ペット作成のテスト' do
      visit new_pet_path
      fill_in "pet_name", with: 'test'
      fill_in 'pet_age', with: 7
      fill_in 'pet_size', with: 7
      fill_in 'pet_weight', with: 7
      click_on '登録する'
      expect(page).to have_content 'test'
      expect(page).to have_content 7
    end
    it 'ペット詳細のテスト' do
      visit pet_path(@pet.id)
      expect(page).to have_content @pet.name
      expect(page).to have_content @pet.age
      expect(page).to have_content @pet.content
    end
  end

end