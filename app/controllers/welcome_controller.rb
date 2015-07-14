class WelcomeController < ApplicationController
  skip_before_action :authorize

  def index
    @posts = Post.all
  end
end
