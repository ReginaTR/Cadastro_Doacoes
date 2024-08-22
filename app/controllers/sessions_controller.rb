class SessionsController < ApplicationController
  def new
  end

  def create
    institution = Institution.find_by(email: params[:email])
    if institution&.valid_password?(params[:password])
      sign_in(institution)
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password.'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end
