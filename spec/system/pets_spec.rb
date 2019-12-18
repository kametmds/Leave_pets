require 'rails_helper'
# bundle exec rspec spec/system/pets_spec.rb
# bin/rspec spec/system/pets_spec.rb
RSpec.describe 'Pets', type: :system do
  before do #事前ログイン
    @pet = FactoryBot.create(:pet)
    @pet2 = FactoryBot.create(:second_pet)
    @pet3 = FactoryBot.create(:third_pet)
    @pet4 = FactoryBot.create(:fourth_pet)
    visit new_user_session_path
    fill_in 'user_email', with: 'user1@test.com'
    fill_in 'user_password', with: 'password1'
    click_on 'ログイン'
  end

  describe 'ペット管理機能' do
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
    it 'ペット削除のテスト' do
      visit pet_path(@pet.id)
      click_on '削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'ペット情報削除しました'
    end
  end

end