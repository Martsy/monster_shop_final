class Profile::LocalesController < ApplicationController
  def new
    @locale = Locale.new
    @user = current_user
  end

  def create
    user = current_user
    locale = user.locales.create(locale_params)
    redirect_to profile_path
  end

  private

  def locale_params
    params.require(:locale).permit(:nickname, :address, :city, :state, :zip)
  end
end
