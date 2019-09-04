class MeetingLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting_log, only: [:edit, :update, :show, :destroy, :toggle_status]
  before_action :ensure_correct_user, only: [:edit, :update, :show, :destroy]

  def index
    @tags = Tag.all
    if params[:meeting_log].nil?
      @meeting_logs = current_user.meeting_logs.order(created_at: :desc).page(params[:page])
    elsif params[:meeting_log][:search] && params[:meeting_log][:tag_id].blank?
      @meeting_logs = current_user.meeting_logs.search(params[:meeting_log][:name]).page(params[:page])
    elsif params[:meeting_log][:name].blank? && params[:meeting_log][:tag_id]
      @meeting_logs = current_user.meeting_logs.joins(:tags).search(params[:meeting_log][:tag_id]).page(params[:page])
    elsif params[:meeting_log][:name] && params[:meeting_log][:tag_id]
      @meeting_logs = current_user.meeting_logs.search(params[:meeting_log][:name]).joins(:tags).search(params[:meeting_log][:tag_id]).page(params[:page]).page(params[:page])
    else
      redirect_to meeting_logs_path
    end
    @meeting_logs = current_user.meeting_logs.all.order(:status).page(params[:page]) if params[:sort_status]
  end

  def new
    @meeting_log = MeetingLog.new
  end

  def create
    @meeting_log = current_user.meeting_logs.build(meeting_log_params)
    if @meeting_log.save
      redirect_to meeting_logs_path
      flash[:notice] = "対象の記録を作成しました"
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @meeting_log.update(meeting_log_params)
      redirect_to meeting_logs_path
      flash[:notice] = "対象の記録を編集しました"
    else
      render "edit"
    end
  end

  def show
    @tags = Tag.all
    @comments = @meeting_log.comments
    @comment = @meeting_log.comments.build
  end

  def destroy
    @meeting_log.destroy
    redirect_to meeting_logs_path
    flash[:notice] = "対象の記録を削除しました"
  end

  def name_only
    @tags = Tag.all
    if params[:meeting_log].nil?
      @meeting_logs = current_user.meeting_logs.page(params[:page])
    elsif params[:meeting_log][:search] && params[:meeting_log][:tag_id].blank?
      @meeting_logs = current_user.meeting_logs.search(params[:meeting_log][:name]).page(params[:page])
    elsif params[:meeting_log][:name].blank? && params[:meeting_log][:tag_id]
      @meeting_logs = current_user.meeting_logs.joins(:tags).search(params[:meeting_log][:tag_id]).page(params[:page])
    else
      redirect_to meeting_logs_path
    end
    @meeting_logs = current_user.meeting_logs.all.order(:status).page(params[:page]) if params[:sort_status]
  end

  def image_only
    @tags = Tag.all
    if params[:meeting_log].nil?
      @meeting_logs = current_user.meeting_logs.page(params[:page])
    elsif params[:meeting_log][:search] && params[:meeting_log][:tag_id].blank?
      @meeting_logs = current_user.meeting_logs.search(params[:meeting_log][:name]).page(params[:page])
    elsif params[:meeting_log][:name].blank? && params[:meeting_log][:tag_id]
      @meeting_logs = current_user.meeting_logs.joins(:tags).search(params[:meeting_log][:tag_id]).page(params[:page])
    else
      redirect_to meeting_logs_path
    end
    @meeting_logs = current_user.meeting_logs.all.order(:status).page(params[:page]) if params[:sort_status]
  end

  def toggle_status
    @meeting_log.toggle_status!
    redirect_to @meeting_log, notice: '記憶状況を更新しました'
  end

  private

  def meeting_log_params
    params.require(:meeting_log).permit(:name, :day, :place, :memo, :how, :image, :image_cache, :position,
                                        :status, :age, :look, :birth, :blood, :hometown, :other, :sort_status, tag_ids:[])
  end

  def set_meeting_log
    @meeting_log = MeetingLog.find(params[:id] || params[:meeting_log_id])
  end

  def ensure_correct_user
    if current_user.id != @meeting_log.user_id
      flash[:alert] = '操作権限がありません'
      redirect_to meeting_logs_path
    end
  end
end
