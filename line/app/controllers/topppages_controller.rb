class TopppagesController < ApplicationController
  def index
    @users = User.all
  end
end
