require 'rails_helper'
# bundle exec rspec spec/system/users_spec.rb
# bin/rspec spec/system/users_spec.rb
RSpec.describe 'users', type: :system do

  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)
    @user3 = FactoryBot.create(:third_user)
    @user4 = FactoryBot.create(:fourth_user)
    @user5 = FactoryBot.create(:fifth_user)
    @admin = FactoryBot.create(:admin_user)
  end

  describe 'ログイン前' do
    it 'ユーザー登録のテスト&登録したらそのままログインするテスト' do
      visit new_user_registration_path

      fill_in "user_name", with: 'user6'
      fill_in 'user_email', with: 'user6@test.com'
      fill_in 'user_password', with: 'password6'
      fill_in 'user_password_confirmation', with: 'password6'
      click_on 'ユーザ登録'
      expect(page).to have_content 'アカウント登録が完了しました。'
    end
    it '未ログインでサービスのページに飛ぼうとした場合、ログインページに遷移するテスト' do
      visit spaces_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end
  end

  describe 'ログイン後' do
    before do #事前ログイン
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@test.com'
      fill_in 'user_password', with: 'password1'
      click_on 'ログイン'
    end

    it 'ログアウトのテスト' do
      click_on 'ログアウト'
      expect(page).to have_content "ユーザーログイン"
    end
    it 'マイページのテスト' do
      click_on 'マイページ'
      expect(page).to have_content "user1のページ"
      expect(page).to have_content "マイペット情報"
      expect(page).to have_content "ホストスペース情報"
      expect(page).to have_content "予約履歴"
      expect(page).to have_content "あなたのスペースへの予約依頼"
    end
    it 'ログイン時、ユーザ登録画面に行かせないテスト' do
      visit new_user_session_path
      expect(page).to have_content "すでにログインしています。"
    end
  end
end