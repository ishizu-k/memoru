require 'rails_helper'

RSpec.feature "コメント機能", type: :feature do
  background do
    # コメントの作成
    @comment1 = FactoryBot.create(:comment)
    @comment1_id = @comment1.id
    # コメントに紐づいた対象のid
    @meetinglog1_id = @comment1.meeting_log.id
    # @meetinglog1 = FactoryBot.create(:meeting_log)
    # @meetinglog1_id = @meetinglog1.id
    # ログイン
    visit new_user_session_path
    fill_in 'Eメールアドレス', with: 'test@test.com'
    fill_in 'パスワード', with: '111111'
    click_button "ログイン"
  end

  scenario 'コメントの作成', js: true do
    visit meeting_log_path(@meetinglog1_id)
    fill_in 'comment_content', with: 'test'
    click_button "追加"
    sleep 3.0
    expect(Comment.last.content).to eq 'test'
  end

  scenario 'コメントの削除', js: true do
    visit meeting_log_path(@meetinglog1_id)
    click_link '削除', href: "/meeting_logs/2/comments/3"
    expect(page).to_not have_content 'test-comment'
  end
end
