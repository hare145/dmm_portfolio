class Public::HomesController < ApplicationController
  def top
    @users = User.all
  end
end