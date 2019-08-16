class MeetingLogsController < ApplicationController
  before_action :set_meeting_log, only: [:edit, :update, :show, :destroy]

  def index
    @tags = Tag.all
    if params[:meeting_log].nil?
      @meeting_logs = MeetingLog.all
    elsif params[:meeting_log][:search] && params[:meeting_log][:tag_id].blank?
      @meeting_logs = MeetingLog.search(params[:meeting_log][:name])
    elsif params[:meeting_log][:name].blank? && params[:meeting_log][:tag_id]
      @meeting_logs = MeetingLog.joins(:tags).search(params[:meeting_log][:tag_id])
    else
      redirect_to meeting_logs_path
    end
  end

  def new
    @meeting_log = MeetingLog.new
  end

  def create
    @meeting_log = MeetingLog.new(meeting_log_params)
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
  end

  def destroy
    @meeting_log.destroy
    redirect_to meeting_logs_path
    flash[:notice] = "対象の記録を削除しました"
  end

  private

  def meeting_log_params
    params.require(:meeting_log).permit(:name, :day, :place, :memo, :how, :image, :image_cache, :position,
                                        :status, :age, :look, :birth, :blood, :hometown, :other, tag_ids:[])
  end

  def set_meeting_log
    @meeting_log = MeetingLog.find(params[:id])
  end
end
