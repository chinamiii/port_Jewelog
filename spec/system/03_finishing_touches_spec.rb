require 'rails_helper'

describe '[STEP3] 仕上げのテスト' do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:other_post) { create(:post, user: other_user) }

  describe 'サクセスメッセージのテスト' do
    subject { page }

    it 'ユーザ新規登録成功時' do
      visit new_user_registration_path
      fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
      fill_in 'user[email]', with: 'a' + user.email # 確実にuser, other_userと違う文字列にするため
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '登録'
      is_expected.to have_content 'アカウント登録が完了しました。'
    end
    it 'ユーザログイン成功時' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      is_expected.to have_content 'ログインしました。'
    end
    it 'ユーザログアウト成功時' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      logout_link = find_all('a')[4].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
      is_expected.to have_content 'ログアウトしました。'
    end
    it 'ユーザのプロフィール情報更新成功時' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit edit_user_path(user)
      click_button 'これでOK!'
      is_expected.to have_content '変更が完了しました。'
    end
    it '投稿データの新規投稿成功時: マイページから行います。' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit new_post_path
      click_button '投稿する'
      is_expected.to have_content '投稿が完了しました。'
    end
  end

end