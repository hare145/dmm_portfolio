class Public::HomesController < ApplicationController
  def top
    @users = User.all.limit(4)
  end
end
