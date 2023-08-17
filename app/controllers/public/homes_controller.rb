class Public::HomesController < ApplicationController
  def top
    @users = User.all.limit(3)
  end
end
