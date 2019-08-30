require 'rails_helper'

RSpec.feature "対象の管理機能", type: :feature do
    background do
      # 対象の作成
      @meeting_log1 = FactoryBot.create(:meeting_log, :skip_validate)
      @meetinglog1_id = @meeting_log1.id
      @meeting_log2 = FactoryBot.create(:second_meeting_log)
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

  scenario "対象の一覧画面（そのユーザーが作成した対象のみ表示）" do
    visit meeting_logs_path
    expect(page).to have_content "test-name"
    expect(page).not_to have_content "second-name"
  end

  scenario "対象の新規作成" do
    visit new_meeting_log_path
    fill_in '名前', with: 'alice'
    fill_in '肩書き', with: '主人公'
    fill_in 'when?', with: '2019-08-01'
    fill_in 'where?', with: 'ハートの国'
    fill_in 'what?', with: '裁判に参加した'
    fill_in 'how?', with: 'お互いに話を聞いていなかった'
    attach_file 'イメージ画像', "app/assets/images/nurse.png"
    check "meeting_log_tag_ids_#{@tag1_id}"
    check "meeting_log_tag_ids_#{@tag2_id}"
    fill_in '年齢', with: '10'
    fill_in '外見的特徴', with: '水色のエプロンワンピース'
    select '2009', from: 'meeting_log_birth_1i'
    select '8', from: 'meeting_log_birth_2i'
    select '1', from: 'meeting_log_birth_3i'
    select 'A型', from: '血液型'
    fill_in '出身', with: 'フランス'
    fill_in '備考欄', with: '特になし'
    click_button "記録する"
    expect(page).to have_content "対象の記録を作成しました"
  end

  scenario "対象の詳細画面" do
    visit meeting_logs_path
    click_link 'test-name'
    expect(page).to have_content "test-nameさん"
    expect(page).to have_content "test-position"
    expect(page).to have_content "追加エピソード"
  end

  scenario "対象の編集" do
    visit  edit_meeting_log_path(@meetinglog1_id)
    # 編集画面
    expect(page).to have_field '名前', with: 'test-name'
    expect(page).to have_field '肩書き', with: 'test-position'
    expect(page).to have_field 'when?', with: '2019-08-01'
    expect(page).to have_field 'where?', with: 'test-place'
    expect(page).to have_field 'what?', with: 'test-memo'
    expect(page).to have_field 'how?', with: 'test-how'
    expect(page).to have_field '年齢', with: '19'
    expect(page).to have_field '外見的特徴', with: 'test-look'
    expect(page).to have_select('meeting_log_birth_1i', selected: '2000')
    expect(page).to have_select('meeting_log_birth_2i', selected: '8')
    expect(page).to have_select('meeting_log_birth_3i', selected: '1')
    expect(page).to have_select('血液型', selected: '不明')
    expect(page).to have_field '出身', with: 'test-hometown'
    expect(page).to have_field '備考欄', with: 'test-other'
    # 編集する
    fill_in '名前', with: 'alice'
    click_button "編集する"
    expect(page).to have_content "対象の記録を編集しました"
  end

  scenario "対象の削除" do
    visit meeting_logs_path
    expect(page).to have_content "test-name"
    click_link '削除', href: meeting_log_path(@meetinglog1_id)
    expect(page).to have_content "対象の記録を削除しました"
    expect(page).not_to have_content "test-name"
  end

  scenario "対象名からの検索" do
    visit meeting_logs_path
    # 対象名が存在すれば検索にヒットする
    fill_in 'meeting_log_name', with: 'test-name'
    click_button '検索'
    expect(page).to have_content 'test-name'
    # 対象名が存在しなければ検索にヒットしない
    fill_in 'meeting_log_name', with: 'second-name'
    click_button '検索'
    expect(page).not_to have_content 'second-name'
  end

  scenario "タグからの検索" do
    # タグの付与
    visit  edit_meeting_log_path(@meetinglog1_id)
    check "meeting_log_tag_ids_#{@tag1_id}"
    click_button "編集する"
    # 該当のタグが付与されていれば検索にヒットする
    visit meeting_logs_path
    select 'test-tag', from: 'meeting_log_tag_id'
    click_button '検索'
    expect(page).to have_content 'test-name'
    # 該当のタグが付与されていなければ検索にヒットしない
    select 'second-tag', from: 'meeting_log_tag_id'
    click_button '検索'
    expect(page).not_to have_content 'test-name'
  end
end
