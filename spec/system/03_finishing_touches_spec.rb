require 'rails_helper'

describe '[STEP3] 仕上げのテスト' do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:post) { create(:post,title: title, caption: caption,rate: rate,jewel: jewel, user: user) }
  let(:other_post) { create(:post,title: title, caption: caption,rate: rate,jewel: jewel, user: other_user) }

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
  end

  describe '処理失敗時のテスト' do
    context 'ユーザ新規登録失敗: nameを1文字にする' do
      before do
        visit new_user_registration_path
        @name = Faker::Lorem.characters(number: 1)
        @email = 'a' + user.email # 確実にuser, other_userと違う文字列にするため
        fill_in 'user[name]', with: @name
        fill_in 'user[email]', with: @email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '新規登録されない' do
        expect { click_button '登録' }.not_to change(User.all, :count)
      end
      it '新規登録画面を表示しており、フォームの内容が正しい' do
        click_button '登録'
        expect(page).to have_content '登録'
        expect(page).to have_field 'user[name]', with: @name
        expect(page).to have_field 'user[email]', with: @email
      end
    end
  end

  describe 'ログインしていない場合のアクセス制限のテスト: アクセスできず、ログイン画面に遷移する' do
    subject { current_path }

    it 'ユーザ一覧画面' do
      visit users_path
      is_expected.to eq '/users/sign_in'
    end
    it 'ユーザ詳細画面' do
      visit user_path(user)
      is_expected.to eq '/users/sign_in'
    end
    it 'ユーザ情報編集画面' do
      visit edit_user_path(user)
      is_expected.to eq '/users/sign_in'
    end
    it '投稿一覧画面' do
      visit posts_path
      is_expected.to eq '/users/sign_in'
    end
    it '投稿詳細画面' do
      visit post_path(post)
      is_expected.to eq '/users/sign_in'
    end
    it '投稿編集画面' do
      visit edit_post_path(post)
      is_expected.to eq '/users/sign_in'
    end
  end

end