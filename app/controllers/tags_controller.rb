class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = Tag.all.page(params[:page])
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tags = Tag.all
    if @tag.save
      redirect_to tags_path
      flash[:notice] = "新しいタグを作成しました"
    else
      render "index"
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
    flash[:notice] = "タグを削除しました"
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
