require 'rails_helper'

RSpec.feature "タグの管理機能", type: :feature do
  background do
    # ユーザーの作成
    FactoryBot.create(:user)
    # タグの作成
    @tag1 = FactoryBot.create(:tag)
    @tag1_id = @tag1.id
    @tag2 = FactoryBot.create(:second_tag)
    @tag2_id = @tag2.id
    # ログイン
    visit new_user_session_path
    fill_in 'Eメールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: '111111'
    click_button "ログイン"
  end

  scenario "タグの作成と削除" do
    visit tags_path
    # 作成
    fill_in "タグ", with: 'third-tag'
    click_button "作成"
    expect(page).to have_content "新しいタグを作成しました"
    # 一覧
    expect(page).to have_content "test-tag"
    expect(page).to have_content "second-tag"
    expect(page).to have_content "third-tag"
    # 削除
    click_link '削除', href: tag_path(@tag1_id)
    expect(page).to have_content "タグを削除しました"
    # 一覧
    expect(page).not_to have_content "test-tag"
    expect(page).to have_content "second-tag"
    expect(page).to have_content "third-tag"
  end
end
