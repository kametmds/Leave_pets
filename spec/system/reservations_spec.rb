require 'rails_helper'
# bundle exec rspec spec/system/reservations_spec.rb
# bin/rspec spec/system/reservations_spec.rb
RSpec.describe 'Reservations', type: :system do
  before do #事前ログイン
    @pet = FactoryBot.create(:pet)
    @pet2 = FactoryBot.create(:second_pet)
    @pet3 = FactoryBot.create(:third_pet)
    @pet4 = FactoryBot.create(:fourth_pet)
    @space = FactoryBot.create(:space)
    @space2 = FactoryBot.create(:second_space)
    @space3 = FactoryBot.create(:third_space)
    @space4 = FactoryBot.create(:fourth_space)
    @reservation = FactoryBot.create(:reservation)
    @reservation2 = FactoryBot.create(:second_reservation)
    @reservation3 = FactoryBot.create(:third_reservation)
    @reservation4 = FactoryBot.create(:fourth_reservation)
    visit new_user_session_path
    fill_in 'user_email', with: 'user1@test.com'
    fill_in 'user_password', with: 'password1'
    click_on 'ログイン'
  end

  describe '予約管理機能' do

    it '予約作成のテスト' do
      visit space_path(@space4.id)
      click_on '予約する'
      check "reservation_pet_ids_#{@pet.id}"
      click_on '予約する'
      expect(page).to have_content '予約申請しました'
    end

    it '予約確認のテスト' do
      visit reservation_path(@reservation.id)
      expect(page).to have_content '予約詳細画面'
      expect(page).to have_content @reservation.space.title
      expect(page).to have_content @reservation.status
    end

    it 'ホストユーザー予約状況更新できるテスト' do
      visit edit_reservation_path(@reservation.id)
      expect(page).to have_content '確認後予約状況の変更をお願いします'
    end
  end
end