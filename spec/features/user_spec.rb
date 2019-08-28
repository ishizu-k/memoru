require 'rails_helper'

RSpec.feature "ユーザーの作成・削除とログイン・ログアウト", type: :feature do
    background do
      user = FactoryBot.create(:user)
      user2 = FactoryBot.create(:second_user)
    end

  scenario "ユーザーの新規作成と削除" do
    # 新規作成
    visit new_user_registration_path
    fill_in 'ユーザー名', with: 'tanaka'
    fill_in 'Eメールアドレス', with: 'tanaka@sample.com'
    fill_in 'パスワード', with: '000000'
    fill_in 'パスワード（確認）', with: '000000'
    click_button "新規登録"
    expect(page).to have_content "アカウント登録が完了しました。"
    # 削除
    visit edit_user_registration_path
    click_button "アカウント削除"
    expect(page).to have_content "アカウントを削除しました。"
  end

  scenario "ログインとログアウト" do
    # ログインする
    visit new_user_session_path
    fill_in 'Eメールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: '111111'
    click_button "ログイン"
    expect(page).to have_content "ログインしました。"
    # ログアウトする
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました。"
  end
end
