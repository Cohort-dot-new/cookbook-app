class SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfullly logged in!'
      redirect_to '/recipes'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfullly logged out!'
    redirect_to '/login'
  end
end
