require 'rails_helper'
# bundle exec rspec spec/system/spaces_spec.rb
# bin/rspec spec/system/spaces_spec.rb
RSpec.describe 'spaces', type: :system do
  before do #事前ログイン
    @space = FactoryBot.create(:space)
    @space2 = FactoryBot.create(:second_space)
    @space3 = FactoryBot.create(:third_space)
    @space4 = FactoryBot.create(:fourth_space)
    visit new_user_session_path
    fill_in 'user_email', with: 'user1@test.com'
    fill_in 'user_password', with: 'password1'
    click_on 'Log in'
  end

  describe 'スペース管理機能' do
    it 'スペース一覧のテスト' do
      visit spaces_path
      expect(page).to have_content "場所は京都です"
      expect(page).to have_content "場所は青森です"
      expect(page).to have_content "場所は東京です"
    end
    it 'スペース作成のテスト' do
      visit new_space_path
      fill_in "space_title", with: 'test'
      fill_in 'space_postal', with: '777-7777'
      fill_in 'space_address', with: '神奈川'
      fill_in 'space_tel', with: '77777777777'
      fill_in 'space_capacity', with: 7
      fill_in 'space_content', with: 7
      attach_file 'space_picture', "#{Rails.root}/spec/fixtures/noimage2.jpg"
      click_on '登録する'
      expect(page).to have_content '777-7777'
      expect(page).to have_content '神奈川'
    end
    it 'スペース詳細のテスト' do
      visit space_path(@space.id)
      expect(page).to have_content @space.title
      expect(page).to have_content @space.postal
      expect(page).to have_content @space.address
      expect(page).to have_content @space.tel
      expect(page).to have_content @space.capacity
    end
  end

end