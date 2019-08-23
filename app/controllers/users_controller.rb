class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
  end

  def show
    @user = User.find(current_user[:id])
  end
end
