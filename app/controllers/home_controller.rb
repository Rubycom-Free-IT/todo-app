class HomeController < ApplicationController
  def index
  end

  def registration
    @user = NewUser.new

    render :registration, layout: 'devise'
  end

  def complete_registration
    @user = NewUser.new(params.require(:new_user).permit(:email, :password, :starting_points))

    if @user.save
      redirect_to home_path
    else
      render :registration, layout: 'devise'
    end
  end
end
